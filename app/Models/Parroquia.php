<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Parroquia extends Model
{
     //
     use HasFactory;

     protected $guarded = [];
 

     public function canton(): BelongsTo
     {
         return $this->belongsTo(Canton::class);
     }

     public function cliente():BelongsTo
     {
        return $this->belongsTo(Cliente::class);
     }
}
