@extends('Backend.Formation.index')
@section('tab-content')
<div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
    <div class="row">
        <div class="col-md-12 col-lg-6">
            <div class="card">
                <div class="card-header clearfix">
                    <div class="float-start">
                        {{__('Fracture Pressure')}}
                    </div>
                    <div class="float-end">
                    </div>
                </div>
                <div class="card-body overflow-auto clearfix">
                    <table id="dataTable" class="table table-responsive">
                        <thead>
                            <tr>
                                <th class="text-center">{{__('Depth(TVD)')}}</th>
                                <th class="text-center">{{__('Fracture Gradient')}}</th>
                                <th class="text-center">{{__('Pressure')}}</th>
                                <th class="text-center">
                                    <button type="button" data-bs-toggle="modal" data-bs-target="#addTrajectoryModal" class="btn btn-primary p-0"><i class="fas fa-plus"></i></button>
                                </th>
                            </tr>
                            <tr>
                                @php
                                    if(session()->has('unitIds')){
                                        $unitIds = json_decode(session()->get('unitIds'));
                                        if(isset($unitIds->fracture)) $fractureIds = $unitIds->fracture;
                                    }
                                @endphp
                                <form action="{{route('formation.setunit')}}" method="POST" id="setUnitForm">
                                    @csrf
                                    <input type="hidden" name="tab" value="{{$tab}}">
                                    <th class="text-center">
                                        <select name="tvdUnit" id="setUnit">
                                            @foreach ($lengthUnits as $key => $item)
                                                @php
                                                    $selected = '';
                                                    if(isset($fractureIds))
                                                        if($item->id == $fractureIds->tvd) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </th>
                                    <th class="text-center">
                                        <select name="fractGradUnit" id="setUnit">
                                            @foreach ($densityUnits as $key => $item)
                                                @php
                                                    $selected = '';
                                                    if(isset($fractureIds))
                                                        if($item->id == $fractureIds->fractGrad) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </th>
                                    <th class="text-center">
                                        <select name="pressureUnit" id="setUnit">
                                            @foreach ($pressureUnits as $key => $item)
                                                @php
                                                    $selected = '';
                                                    if(isset($fractureIds))
                                                        if($item->id == $fractureIds->pressureUnit) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </th>
                                    <th class="text-center">
                                    </th>
                                </form>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                if(session()->has('unitValues')){
                                    $unitValues = json_decode(session()->get('unitValues'));
                                    if (isset($unitValues->fracture)) {
                                        $fractureValues = $unitValues->fracture;
                                    }
                                }
                            @endphp
                            @foreach ($fgpressure as $item)
                                <tr>
                                    <td class="text-center"> @if(isset($fractureValues)) {{$item->TVD * $fractureValues->tvd}} @else {{$item->TVD}} @endif </td>
                                    <td class="text-center"> @if(isset($fractureValues)) {{$item->FG * $fractureValues->fractGrad}} @else {{$item->FG}} @endif </td>
                                    <td class="text-center"> @if(isset($fractureValues)) {{$item->Pressure * $fractureValues->pressureUnit}} @else {{$item->Pressure}} @endif </td>
                                    <td class="text-center"> 
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#delete{{$item->FG_ID}}"><i class="fas fa-minus"></i></button>
                                        <div class="modal fade" id="delete{{ $item->FG_ID }}" data-bs-backdrop="static"
                                            data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                                            aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                <form action="{{ route('admin.fgpressure.destroy') }}" method="post" id="delete{{ $item->FG_ID }}">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{ $item->FG_ID }}">
                                                    <div class="p-4 text-center">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="56" height="56" fill="currentColor"
                                                        class="bi bi-exclamation-circle text-danger" viewBox="0 0 16 16">
                                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                        <path
                                                        d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
                                                    </svg>
                                                    <div class="h3 text-danger mt-3">Are you sure?</div>
                                                    <p class="mb-4">
                                                        You will lose all data that is related to this project
                                                    </p>
                                                    <div class="d-flex align-items-center justify-content-center">
                                                        <button type="button" class="btn btn-success me-4 px-5"
                                                        data-bs-dismiss="modal">No</button>
                                                        <button type="submit" class="btn btn-danger px-5">Yes</button>
                                                    </div>
                                                    </div>
                                                </form>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="float-end">
                        {{ $fgpressure->links() }}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-6">
            <div id="divplot"></div>
        </div>
    </div>
</div>
@endsection