<?php

namespace App\Http\Controllers;

use App\Models\Tema;
use Illuminate\Http\Request;

class TemaController extends Controller
{
    public function index()
    {
        return Tema::all();
    }

    public function show($id)
    {
        return response()->json(Tema::find($id));
    }

    public function store(Request $request)
    {
        (new Tema())->fill($request->all())->save();
    }

    public function update(Request $request, $id)
    {
        (Tema::findorFail($id))->fill($request->all())->save();
    }
    public function destroy($id)
    {
        Tema::findOrFail($id)->delete();
    }
}
