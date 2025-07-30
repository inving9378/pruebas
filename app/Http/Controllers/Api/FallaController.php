<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Falla;

class FallaController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'mensaje' => 'required|string|max:5000',
        ]);

        Falla::create([
            'cliente_id' => Auth::user()->id,
            'mensaje' => $request->mensaje,
            'estatus' => 'pendiente',
        ]);

        return response()->json(['message' => 'Falla registrada como ticket']);
    }
}
