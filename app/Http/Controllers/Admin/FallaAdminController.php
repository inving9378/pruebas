<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Falla;

class FallaAdminController extends Controller
{
    public function index()
    {
        $fallas = Falla::latest()->paginate(10);
        return view('admin.fallas.index', compact('fallas'));
    }

    public function responder(Request $request, $id)
    {
        $falla = Falla::findOrFail($id);
        $falla->estatus = $request->input('estatus', 'resuelto');
        $falla->save();

        return redirect()->back()->with('success', 'Falla actualizada correctamente.');
    }
}
