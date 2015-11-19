<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "m_catalogue".
 *
 * @property integer $id
 * @property string $uid
 * @property string $title
 * @property integer $subtitle
 * @property string $description
 * @property string $price
 * @property string $currency_code
 * @property string $price_special
 * @property integer $price_special_note
 * @property integer $order
 * @property integer $add_ts
 * @property integer $active
 * @property integer $category_id
 * @property integer $views
 * @property integer $special
 * @property integer $last_seen_ts
 * @property integer $manufacturer_id
 * @property string $code
 * @property integer $amount_in_stock
 * @property integer $spec_id
 * @property integer $type_id
 * @property integer $payment_method_id
 * @property string $pscs
 * @property string $contact_phone
 * @property string $contact_email
 * @property string $header_image
 * @property integer $user_id
 * @property string $show_period_days
 * @property integer $show_till_ts
 * @property string $address
 * @property string $country
 * @property string $city
 * @property integer $precision
 * @property string $latitude
 * @property string $longitude
 * @property string $unique_ref_id
 * @property string $delivery
 * @property string $web
 */
class MCatalogue extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'm_catalogue';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid', 'title', 'subtitle', 'description', 'price', 'currency_code', 'price_special', 'price_special_note', 'order', 'add_ts', 'category_id', 'views', 'last_seen_ts', 'manufacturer_id', 'code', 'amount_in_stock', 'spec_id', 'type_id', 'payment_method_id', 'pscs', 'contact_phone', 'contact_email', 'header_image', 'user_id', 'show_period_days', 'show_till_ts', 'address', 'country', 'city', 'precision', 'latitude', 'longitude', 'unique_ref_id', 'delivery', 'web'], 'required'],
            [['subtitle', 'price_special_note', 'order', 'add_ts', 'active', 'category_id', 'views', 'special', 'last_seen_ts', 'manufacturer_id', 'amount_in_stock', 'spec_id', 'type_id', 'payment_method_id', 'user_id', 'show_till_ts', 'precision'], 'integer'],
            [['description'], 'string'],
            [['price', 'price_special', 'pscs'], 'number'],
            [['uid', 'title', 'contact_phone', 'contact_email', 'header_image', 'address', 'country', 'city'], 'string', 'max' => 255],
            [['currency_code', 'show_period_days', 'latitude', 'longitude', 'unique_ref_id'], 'string', 'max' => 32],
            [['code'], 'string', 'max' => 100],
            [['delivery', 'web'], 'string', 'max' => 50],
            [['uid'], 'unique']
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
            'subtitle' => 'Subtitle',
            'description' => 'Description',
            'price' => 'Price',
            'currency_code' => 'Currency Code',
            'price_special' => 'Price Special',
            'price_special_note' => 'Price Special Note',
            'order' => 'Order',
            'add_ts' => 'Add Ts',
            'active' => 'Active',
            'category_id' => 'Category ID',
            'views' => 'Views',
            'special' => 'Special',
            'last_seen_ts' => 'Last Seen Ts',
            'manufacturer_id' => 'Manufacturer ID',
            'code' => 'Code',
            'amount_in_stock' => 'Amount In Stock',
            'spec_id' => 'Spec ID',
            'type_id' => 'Type ID',
            'payment_method_id' => 'Payment Method ID',
            'pscs' => 'Pscs',
            'contact_phone' => 'Contact Phone',
            'contact_email' => 'Contact Email',
            'header_image' => 'Header Image',
            'user_id' => 'User ID',
            'show_period_days' => 'Show Period Days',
            'show_till_ts' => 'Show Till Ts',
            'address' => 'Address',
            'country' => 'Country',
            'city' => 'City',
            'precision' => 'Precision',
            'latitude' => 'Latitude',
            'longitude' => 'Longitude',
            'unique_ref_id' => 'Unique Ref ID',
            'delivery' => 'Delivery',
            'web' => 'Web',
        ];
    }
}
