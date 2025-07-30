<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ClienteController extends Controller
{
    public function perfil()
    {
        return response()->json(Auth::user());
    }

    public function facturas()
    {
        return response()->json([
            ['id' => 1, 'fecha' => '2025-07-01', 'monto' => 500, 'estatus' => 'Pagada'],
            ['id' => 2, 'fecha' => '2025-08-01', 'monto' => 500, 'estatus' => 'Pendiente']
        ]);
    }

    public function promociones()
    {
        return response()->json([
            ['codigo' => 'AMIGO2025', 'beneficio' => '10% descuento'],
            ['codigo' => 'MESGRATIS', 'beneficio' => '1 mes sin costo']
        ]);
    }
}
