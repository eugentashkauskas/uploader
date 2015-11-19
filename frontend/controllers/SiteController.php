<?php
namespace frontend\controllers;

use app\models\Files;
use app\models\MCatalogue;
use app\models\MCatalogueCategories;
use app\models\MCatalogueImages;
use app\models\MCurrenciesExchangeRates;
use Yii;
use common\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\web\UploadedFile;
use yii\db\Expression;


/**
 * Site controller
 */
class SiteController extends Controller
{

    const ORDER_IMAGE = 0;
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        if (!\Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending email.');
            }

            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    /**
     * Signs user up.
     *
     * @return mixed
     */
    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post())) {
            if ($user = $model->signup()) {
                if (Yii::$app->getUser()->login($user)) {
                    return $this->goHome();
                }
            }
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    /**
     * Requests password reset.
     *
     * @return mixed
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');

                return $this->goHome();
            } else {
                Yii::$app->session->setFlash('error', 'Sorry, we are unable to reset password for email provided.');
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    /**
     * Resets password.
     *
     * @param string $token
     * @return mixed
     * @throws BadRequestHttpException
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password was saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }


    public function actionUploader(){

        $model = new MCatalogueImages();
        $modelCatalog = new MCatalogue();

        $user_id = Yii::$app->user->id;
        $currency_type = MCurrenciesExchangeRates::find(['name' =>'Euro'])->one();
        $category = MCatalogueCategories::find(['uid'=>'transport'])->one();

        Yii::$app->params['uploadUrl'] = Yii::$app->request->baseUrl.'/frontend/uploads/images/stickers/';
        if($image=UploadedFile::getInstance($model,'image')){

            if (empty($image)) {
                return false;
            }
            $ext = strrchr($image->name, ".");
            $current_name = Yii::$app->security->generateRandomString();
            $model->image = Yii::getAlias('@imgPath').'/'.$current_name."{$ext}";
            $model->main_image = 0;
            $model->active = 1;
            $model->order = self::ORDER_IMAGE+1;

            $modelCatalog->uid = 'test_uid_'.Yii::$app->security->generateRandomString();
            $modelCatalog->user_id = 151;
            $modelCatalog->title = 'Test Title';
            $modelCatalog->description = 'Test Description';
            $modelCatalog->currency_code = $currency_type->currency;
            $modelCatalog->active = 1;
            $modelCatalog->precision = 1;
            $modelCatalog->category_id = $category->id;
            $modelCatalog->header_image = $model->image;
            $modelCatalog->show_period_days = '1_week';
            $modelCatalog->address = 'Latvia';
            $modelCatalog->latitude = '56.9496487';
            $modelCatalog->longitude = '24.10518639999998';
            $modelCatalog->add_ts = $_SERVER['REQUEST_TIME'];
            $modelCatalog->show_till_ts = $_SERVER['REQUEST_TIME'];

            if ($model->save(false)) {

                if ($image !== false) {
                    if(isset($model->image)){
                        $path =  Yii::getAlias('@imageBaseUrl') .'/'. $current_name."{$ext}";
                    }
                    $image->saveAs($path);
                }
                Yii::$app->getSession()->setFlash('success', 'Image saved.');
                if($modelCatalog->save(false)){
                    if(Yii::$app->request->isAjax){
                        return $this->redirect('/index.php?r=site%2Fuploader');
                    }else{
                        Yii::$app->getSession()->setFlash('success', 'Image saved.');
                    }
                }
            }else{
                return $model->getErrors();
            }

        }else{
            return $this->render('uploader', [
                'model' => $model,
            ]);

        }
    }

}
