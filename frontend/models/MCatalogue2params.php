<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "m_catalogue2params".
 *
 * @property integer $id
 * @property integer $product_id
 * @property integer $param_id
 * @property string $value
 */
class MCatalogue2params extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'm_catalogue2params';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['product_id', 'param_id', 'value'], 'required'],
            [['product_id', 'param_id'], 'integer'],
            [['value'], 'string', 'max' => 1000]
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
            'param_id' => 'Param ID',
            'value' => 'Value',
        ];
    }
}
