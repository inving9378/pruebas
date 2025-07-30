<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ClienteController;
use App\Http\Controllers\Api\FallaController;

Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/cliente', [ClienteController::class, 'perfil']);
    Route::get('/cliente/facturas', [ClienteController::class, 'facturas']);
    Route::get('/cliente/promociones', [ClienteController::class, 'promociones']);
    Route::post('/cliente/reportar-falla', [FallaController::class, 'store']);
});
