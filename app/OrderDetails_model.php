<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDetails_model extends Model
{
    protected $table = 'order_details';
    protected $primaryKey = 'id';
    protected $fillable = ['orders_id', 'products_is', 'quantity'];
}
