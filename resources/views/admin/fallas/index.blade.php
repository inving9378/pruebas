@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Reportes de Fallas</h1>
    @foreach ($fallas as $falla)
        <div class="card my-3">
            <div class="card-body">
                <h5>Cliente ID: {{ $falla->cliente_id }}</h5>
                <p><strong>Mensaje:</strong> {{ $falla->mensaje }}</p>
                <p><strong>Estatus:</strong> {{ $falla->estatus }}</p>
                <form method="POST" action="{{ route('admin.fallas.responder', $falla->id) }}">
                    @csrf
                    <select name="estatus" class="form-select w-auto d-inline">
                        <option value="pendiente" {{ $falla->estatus == 'pendiente' ? 'selected' : '' }}>Pendiente</option>
                        <option value="en proceso" {{ $falla->estatus == 'en proceso' ? 'selected' : '' }}>En proceso</option>
                        <option value="resuelto" {{ $falla->estatus == 'resuelto' ? 'selected' : '' }}>Resuelto</option>
                    </select>
                    <button class="btn btn-primary">Actualizar</button>
                </form>
            </div>
        </div>
    @endforeach

    {{ $fallas->links() }}
</div>
@endsection
