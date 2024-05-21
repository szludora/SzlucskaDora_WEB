<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Szavak extends Model
{
    use HasFactory;

    protected $fillable = [
        "angol",
        "magyar",
        "temaId",
    ];

    protected $hidden = ["created_at", "updated_at"];

    protected $appends = ["tema"];

    public function getTemaAttribute()
    {
        return Tema::find($this->temaId)->temanev;
    }
}
