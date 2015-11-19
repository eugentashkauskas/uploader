<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use kartik\file\FileInput;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

$this->title = 'Upload images';
$this->params['breadcrumbs'][] = $this->title;

?>

<div class="form-group">
    <div class="col-sm-12" style="text-align: center;font-size: 45px;"><span class="title-uploader" style="font-size: 24px;text-align: center">Add image</span></div>
    <div class="col-sm-12" style="margin-bottom: 20px;">
        <div class="spacing top text mini">
        <?php
            if(isset($sticker) && !empty($sticker)){
                $upload_image = Html::img($sticker->header_image, ['class'=>'file-preview-image', 'alt'=>'TEST', 'title'=>'Test']);
            }
            $caption = '<label class="label_mcatalogueimages_image" for="uploadform-imagefiles"><span class="glyphicon glyphicon-plus"></span><div class="icon-title">Add image header</div></label>';
            $buttonSelect = 'or, <strong>Select Files</strong>';
            $tpl='<div class="file-preview"><div class="file-drop-zone"><div class="file-preview-thumbnails preview-cusotm"></div></div><div class="clearfix"></div>';
            $form=ActiveForm::begin([
                'options' => ['enctype' => 'multipart/form-data', 'id'=>'m_catalog_images']
            ]);
?>

    <div id="m_catalog_images_drag">
        <?php
        echo FileInput::widget([
            'model'=>$model,
            'attribute' => 'imageFiles[]',
            'options' => ['multiple' => true],
            'pluginOptions' => [
                'showPreview' => true,
                'showCaption' => false,
                'showRemove' => false,
                'showUpload' => false,
                'browseClass' => 'btn btn-primary btn-block btn-custom',
                'browseIcon' => '',
                'uploadUrl' => Url::to(['/site/uploader']),
                'initialPreview'=>[
                         $caption
                    ],
                'browseLabel' =>  $buttonSelect,
                'layoutTemplates'=>[
                    'preview'=>$tpl
                ],
                'pluginEvents' => [

                ],
                'options' => ['accept' => 'image/*']
            ]
        ]);
        ?>


    </div>
    <?php   echo Html::hiddenInput('MAX_FILE_SIZE', '9000000000');

            ActiveForm::end();
            ?>
        </div>
    </div>
</div>

