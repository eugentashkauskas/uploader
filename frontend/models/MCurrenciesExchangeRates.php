<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "m_currencies_exchange_rates".
 *
 * @property string $currency
 * @property string $rate
 * @property integer $date
 * @property integer $base
 * @property string $name
 * @property string $sign
 */
class MCurrenciesExchangeRates extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'm_currencies_exchange_rates';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['currency', 'rate', 'date', 'base', 'name', 'sign'], 'required'],
            [['rate'], 'number'],
            [['date', 'base'], 'integer'],
            [['currency'], 'string', 'max' => 3],
            [['name', 'sign'], 'string', 'max' => 32]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'currency' => 'Currency',
            'rate' => 'Rate',
            'date' => 'Date',
            'base' => 'Base',
            'name' => 'Name',
            'sign' => 'Sign',
        ];
    }
}
