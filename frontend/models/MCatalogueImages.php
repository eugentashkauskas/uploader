<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "m_catalogue_images".
 *
 * @property integer $id
 * @property integer $product_id
 * @property string $image
 * @property integer $order
 * @property integer $active
 * @property integer $main_image
 */
class MCatalogueImages extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'm_catalogue_images';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['product_id', 'image', 'order'], 'required'],
            [['product_id', 'order', 'active', 'main_image'], 'integer'],
            [['image'], 'string', 'max' => 255],
            [['image'], 'file','skipOnEmpty' => false,'extensions' => 'png,jpg,gif']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'product_id' => 'Product ID',
            'image' => 'Image',
            'order' => 'Order',
            'active' => 'Active',
            'main_image' => 'Main Image',
        ];
    }
}
