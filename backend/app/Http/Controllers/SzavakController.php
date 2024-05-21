<?php

namespace App\Http\Controllers;

use App\Models\Szavak;
use Illuminate\Http\Request;

class SzavakController extends Controller
{
    public function index()
    {
        return Szavak::all();
    }

    public function show($id)
    {
        return response()->json(Szavak::find($id));
    }

    public function store(Request $request)
    {
        (new Szavak())->fill($request->all())->save();
    }

    public function update(Request $request, $id)
    {
        (Szavak::findorFail($id))->fill($request->all())->save();
    }
    public function destroy($id)
    {
        Szavak::findOrFail($id)->delete();
    }
}
