<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Expedition_model extends Model
{
    protected $table = 'expeditions';
    protected $primaryKey = 'id';
    protected $fillable = ['expedition_name', 'type', 'estimation', 'base_charge'];
}
