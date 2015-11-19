<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "m_catalogue_categories".
 *
 * @property integer $id
 * @property string $uid
 * @property integer $title
 * @property integer $description
 * @property integer $add_ts
 * @property integer $order
 * @property integer $active
 * @property integer $pid
 * @property string $icon_img
 * @property integer $specification_id
 */
class MCatalogueCategories extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'm_catalogue_categories';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid', 'title', 'description', 'add_ts', 'order', 'pid', 'icon_img', 'specification_id'], 'required'],
            [['title', 'description', 'add_ts', 'order', 'active', 'pid', 'specification_id'], 'integer'],
            [['uid', 'icon_img'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'uid' => 'Uid',
            'title' => 'Title',
            'description' => 'Description',
            'add_ts' => 'Add Ts',
            'order' => 'Order',
            'active' => 'Active',
            'pid' => 'Pid',
            'icon_img' => 'Icon Img',
            'specification_id' => 'Specification ID',
        ];
    }
}
