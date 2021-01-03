<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Orders_model extends Model
{
    protected $table = 'orders';
    protected $primaryKey = 'id';
    protected $fillable = [
        'users_id', 'expedition', 'shipping_charge', 'coupon_id', 'coupon_amount', 'grand_total', 'order_date', 'checkout_status', 'struk', 'resi', 'shipping_status', 'shipping_date', 'receipt_status', 'receipt_date', 'address', 'kelurahan', 'kecamatan', 'postcode', 'mobile'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'users_id', 'id');
    }
    public function coupon()
    {
        return $this->belongsTo(Coupon_model::class, 'coupon_id', 'id');
    }
    public function expedition()
    {
        return $this->belongsTo(Expedition_model::class, 'expedition', 'id');
    }
}
