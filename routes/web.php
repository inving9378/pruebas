<?php

Route::get('/prueba', function () {
    return 'Laravel funciona y responde rutas públicas.';
});

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\FallaAdminController;

Route::middleware(['auth', 'admin'])->prefix('admin')->group(function () {
    Route::get('/fallas', [FallaAdminController::class, 'index'])->name('admin.fallas.index');
    Route::post('/fallas/{id}/responder', [FallaAdminController::class, 'responder'])->name('admin.fallas.responder');
});
