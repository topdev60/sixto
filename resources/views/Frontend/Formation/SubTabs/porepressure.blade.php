@extends('Frontend.Formation.index')
@section('tab-content')
<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
    <div class="row">
        <div class="col-md-12 col-lg-6">
            <div class="card">
                <div class="card-header clearfix">
                    <div class="float-start">
                        {{__('Pore Pressure')}}
                    </div>
                    <div class="float-end">
                        <button type="button" class="btn btn-primary p-0" data-bs-toggle="dropdown"><i class="fas fa-cog"></i></button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="javascript:void(0)" onclick="pastePorePressureFunc()"> {{__('Paste from Clipboard')}} </a></li>
                            <li><a class="dropdown-item" href="{{route('user.porepressure.export', session()->get('projectId'))}}"> {{__('Export to Excel')}} </a></li>
                            <li><a class="dropdown-item" href="{{route('user.porepressure.destroyAllRows', session()->get('projectId'))}}"> {{__('Delete All Rows')}} </a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-body overflow-auto clearfix">
                    <table id="dataTable" class="table table-responsive">
                        <thead>
                            <tr>
                                <th class="text-center">{{__('Depth(TVD)')}}</th>
                                <th class="text-center">{{__('Pressure Gradient')}}</th>
                                <th class="text-center">{{__('Pressure')}}</th>
                                <th class="text-center">
                                    <button type="button" data-bs-toggle="modal" data-bs-target="#addModal" class="btn btn-primary p-0"><i class="fas fa-plus"></i></button>
                                </th>
                            </tr>
                            <tr>
                                @php
                                    if(session()->has('unitIds')){
                                        $unitIds = json_decode(session()->get('unitIds'));
                                    }
                                @endphp
                                <form action="{{route('formation.setunit')}}" method="POST" id="setUnitForm">
                                    @csrf
                                
                                    <th class="text-center">
                                        <select name="length" id="setUnit">
                                            @foreach ($lengthUnits as $key => $item)
                                                @php
                                                    $selected = '';
                                                    if(isset($unitIds))
                                                        if($item->id == $unitIds->length_id) $selected = 'selected';
                                                @endphp
                                                    <option value="{{$item->id}}" {{$selected}}> {{$item->name}} </option>
                                            @endforeach
                                        </select>
                                    </th>
                                    <th class="text-center">
                                        <select name="density" id="setUnit">
                                            @foreach ($densityUnits as $key => $item)
                                                @php
                                                    $selected = '';
                                                    if(isset($unitIds))
                                                        if($item->id == $unitIds->density_id) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}> {{$item->name}} </option>
                                            @endforeach
                                        </select>
                                    </th>
                                    <th class="text-center">
                                        <select name="pressure" id="setUnit">
                                            @foreach ($pressureUnits as $key => $item)
                                                @php
                                                    $selected = '';
                                                    if(isset($unitIds))
                                                        if($item->id == $unitIds->pressure_id) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}> {{$item->name}} </option>
                                            @endforeach
                                        </select>
                                    </th>
                                    <th class="text-center">{{' '}}</th>
                                </form>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                if(session()->has('unitValues')){
                                    $unitValues = json_decode(session()->get('unitValues'));
                                    if (isset($unitValues)) {
                                        $length = $unitValues->length;
                                        $density = $unitValues->density;
                                        $pressure = $unitValues->pressure;
                                    }
                                }
                            @endphp
                            @foreach ($porepressure as $item)
                                <tr>
                                    <td class="text-center"> @if(isset($length)) {{$item->TVD * $length}} @else {{$item->TVD}} @endif</td>
                                    <td class="text-center"> @if(isset($density)) {{$item->PP * $density}} @else {{$item->PP}} @endif</td>
                                    <td class="text-center"> @if(isset($pressure)) {{$item->Pressure * $pressure}} @else {{$item->Pressure}} @endif</td>
                                    <td class="text-center"> 
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#delete{{$item->PP_ID}}"><i class="fas fa-minus"></i></button>
                                        {{-- delete modal --}}
                                        <div class="modal fade" id="delete{{ $item->PP_ID }}" data-bs-backdrop="static"
                                            data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                                            aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                <form action="{{ route('user.porepressure.destroy') }}" method="post" id="delete{{ $item->PP_ID }}">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{ $item->PP_ID }}">
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
                                        {{-- delete modal --}}
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="float-end">
                        {{ $porepressure->links() }}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-6">
            <div id="divplot"></div>
        </div>
    </div>
</div>
<div class="modal fade" id="addModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="{{ route('user.porepressure.store') }}" method="post">
            @csrf
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">+ Add {{ __('Pore Pressure') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row gy-3">
                <div class="col-md-4">
                    <label for="" class="form-label">TVD</label>
                    <input type="text" class="form-control" name="tvd" required>
                </div>
                <div class="col-md-4">
                    <label for="" class="form-label">PP</label>
                    <input type="text" class="form-control" name="pp" required>
                </div>
                <div class="col-md-4">
                    <label for="" class="form-label">Pressure</label>
                    <input type="text" class="form-control" name="pressure" required>
                </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            </form>
        </div>
    </div>
</div>
@endsection