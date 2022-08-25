@extends('Backend.layouts.app')
@section('content')
<script src="{{ asset('assets/js/wellbore.js') }}"></script>
<section class="home-section" id="home-section">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
                {{$module}}
            </div>
        </div>
        <div class="row gy-4">
            <div class="col-md-12 col-lg-8">
                <div class="card">
                    <div class="card-header clearfix">
                        <div class="float-start m-2">
                            {{'Section'}}
                        </div>
                        @php
                            if (session()->has('dsInfo')) {
                                $dsInfo = session()->get('dsInfo');
                                $comps = $dsInfo->dscomp()->orderby('Comp_ID', 'asc')->paginate('10');
                            }
                        @endphp
                        <div class="float-start">
                            <form action="{{route('admin.drillstring.show')}}" id="drillsForm" method="POST">
                                @csrf
                                <select name="selectDrillstring" id="selectDrillstring" class="form-control">
                                    @foreach ($drillStrings as $item)
                                        @php
                                            $selected = '';
                                            if($item->DS_ID == $dsInfo->DS_ID) $selected = 'selected';
                                        @endphp
                                        <option value="{{$item->DS_ID}}" {{$selected}}>{{$item->Description}}</option>
                                    @endforeach
                                </select>
                            </form>
                        </div>
                        <div class="float-start m-2">
                            <button type="button" class="btn btn-primary p-0" data-bs-toggle="modal"
                                data-bs-target="#addSectionModal">
                                + Add Section
                            </button>
                        </div>
                        <div class="float-start m-2">
                            <button type="button" class="btn btn-primary p-0" data-bs-toggle="modal"
                                data-bs-target="#editSectionModal">
                                <i class="fas fa-pencil-alt"></i>
                                Edit Section
                            </button>
                        </div>
                        <div class="float-start m-2">
                            <button type="button" class="btn btn-primary p-0" data-bs-toggle="modal"
                                data-bs-target="#deleteSectionModal">
                                <i class="fas fa-trash"></i>
                                Delete Section
                            </button>
                        </div>
                        <div class="float-start dropdown m-l-25 mt-1">
                            <button type="button" role="button" class="btn btn-primary p-0 mt-1" data-bs-toggle="dropdown"><i class="fas fa-cog"></i></button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="javascript:void(0)" onclick="pasteDrillStringFunc()"> {{__('Paste from Clipboard')}} </a></li>
                                <li><a class="dropdown-item" href="{{route('admin.drillstringComp.export', $dsInfo->DS_ID)}}"> {{__('Export to Excel')}} </a></li>
                                <li><a class="dropdown-item" href="{{route('admin.drillstringComp.deleteAllRows', $dsInfo->DS_ID)}}"> {{__('Delete All Rows')}} </a></li>
                            </ul>
                        </div>
                        <div class="float-end m-2">
                            <button type="button" class="btn btn-primary p-0" data-bs-toggle="modal"
                                data-bs-target="#addModal">
                                + Add Component
                            </button>
                        </div>
                    </div>
                    <div class="card-body overflow-auto clearfix">
                        <table id="dataTable" class="table table-responsive">
                            <thead>
                                <tr>
                                    <th class="text-center"> {{__('Description')}} </th>
                                    <th class="text-center"> {{__('ID(in)')}} </th>
                                    <th class="text-center"> {{__('OD(in)')}} </th>
                                    <th class="text-center"> {{__('Weight(lb/ft)')}} </th>
                                    <th class="text-center"> {{__('Length(ft)')}} </th>
                                    <th class="text-center"> {{__('TJ(in)')}} </th>
                                    <th class="text-center"> {{__('Action')}} </th>
                                </tr>
                                <tr>
                                    @php
                                        if(session()->has('DSUnitIds')){
                                            $unitIds    = json_decode(session()->get('DSUnitIds'));
                                        }
                                    @endphp
                                    <form action="{{route('drillstring.setunit')}}" method="POST" id="setUnitDrillStringForm">
                                        @csrf
                                        <th class="text-center"></th>
                                        <th class="text-center">
                                            <select name="diameter" class="setUnitForDrillString">
                                                @foreach ($diameterUnits as $key => $item)
                                                    @php
                                                        $selected = '';
                                                        if(isset($unitIds))
                                                            if($item->id == $unitIds->diameter_id) $selected = 'selected';
                                                    @endphp
                                                    <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </th>
                                        <th class="text-center">
                                            <select name="diameter" class="setUnitForDrillString">
                                                @foreach ($diameterUnits as $key => $item)
                                                    @php
                                                        $selected = '';
                                                        if(isset($unitIds))
                                                            if($item->id == $unitIds->diameter_id) $selected = 'selected';
                                                    @endphp
                                                    <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </th>
                                        <th class="text-center"></th>
                                        <th class="text-center">
                                            <select name="length" class="setUnitForDrillString">
                                                @foreach ($lengthUnits as $key => $item)
                                                    @php
                                                        $selected = '';
                                                        if(isset($unitIds))
                                                            if($item->id == $unitIds->length_id) $selected = 'selected';
                                                    @endphp
                                                    <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </th>
                                        <th class="text-center">
                                            <select name="diameter" class="setUnitForDrillString">
                                                @foreach ($diameterUnits as $key => $item)
                                                    @php
                                                        $selected = '';
                                                        if(isset($unitIds))
                                                            if($item->id == $unitIds->diameter_id) $selected = 'selected';
                                                    @endphp
                                                    <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </th>
                                        <th class="text-center"></th>
                                    </form>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    if(session()->has('DSUnitValues')){
                                        $unitValues = json_decode(session()->get('DSUnitValues'));
                                        if (isset($unitValues)) {
                                            $length     = $unitValues->length;
                                            $diameter   = $unitValues->diameter;
                                        }
                                    }
                                @endphp
                                @foreach ($comps as $item)
                                    <tr>
                                        <td class="text-center">{{$item->Description}}</td>
                                        <td class="text-center">@if(isset($diameter)) {{$item->ID * $diameter}} @else {{$item->ID}} @endif</td>s
                                        <td class="text-center">@if(isset($diameter)) {{$item->OD * $diameter}} @else {{$item->OD}} @endif</td>
                                        <td class="text-center">{{$item->Weight}}</td>
                                        <td class="text-center">@if(isset($length)) {{$item->Length * $length}} @else {{$item->Length}} @endif</td>
                                        <td class="text-center">@if(isset($diameter)) {{$item->TJ * $diameter}} @else {{$item->TJ}} @endif</td>
                                        <td class="text-center">
                                            <div class="btn-group" role="group" aria-label="Basic example">
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                    data-bs-target="#delete{{$item->Comp_ID}}">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                    data-bs-target="#editModal{{$item->Comp_ID}}">
                                                    <i class="fas fa-pencil-alt"></i>
                                                </button>
                                            </div>
                                            {{-- delete modal --}}
                                            <div class="modal fade" id="delete{{ $item->Comp_ID }}" data-bs-backdrop="static"
                                                data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                                                aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                    <form action="{{ route('admin.drillstringComp.destroy') }}" method="post" id="delete{{ $item->Comp_ID }}">
                                                        @csrf
                                                        <input type="hidden" name="id" value="{{ $item->Comp_ID }}">
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
                                            {{-- edit modal --}}
                                            <div class="modal fade" id="editModal{{ $item->Comp_ID }}" data-bs-backdrop="static"
                                                data-bs-keyboard="false" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                                <div class="modal-content">
                                                    <form action="{{ route('admin.drillstringComp.update') }}" method="post">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{ $item->Comp_ID }}">
                                                    <input type="hidden" name="ds_id" value="{{ $dsInfo->DS_ID }}">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editModalLabel">Edit {{ __('DrillString Component') }}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row gy-3">
                                                            <div class="col-md-6">
                                                                <label for="" class="form-label">Description</label>
                                                                <input type="text" class="form-control" name="comp_decription" value="{{ $item->Description }}"
                                                                required>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label for="" class="form-label">OD</label>
                                                                <input type="text" class="form-control" name="comp_od" value="{{ $item->OD }}"
                                                                required>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label for="" class="form-label">ID</label>
                                                                <input type="text" class="form-control" name="comp_id" value="{{ $item->ID }}"
                                                                required>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label for="" class="form-label">TJ</label>
                                                                <input type="text" class="form-control" name="comp_tj" value="{{ $item->TJ }}"
                                                                required>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label for="" class="form-label">Weight</label>
                                                                <input type="text" class="form-control" name="comp_weight"
                                                                value="{{ $item->Weight }}" required>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label for="" class="form-label">Length</label>
                                                                <input type="text" class="form-control" name="comp_length" value="{{ $item->Length }}"
                                                                required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>
                                                    </form>
                                                </div>
                                                </div>
                                            </div>
                                            {{-- edit modal --}}
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="float-end">
                            {{$comps->links()}}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <div id="divplot"></div>
            </div>
        </div>
    </div>
</section>

{{----Add modal----}}
<div class="modal fade" id="addModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="{{ route('admin.drillstringComp.store') }}" method="post">
            @csrf
            <input type="hidden" name="ds_id" value="{{ $dsInfo->DS_ID }}">
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">+ Add {{ __('Drillstring Component') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row gy-3">
                    <div class="col-md-6">
                        <label for="" class="form-label">Description</label>
                        <input type="text" class="form-control" name="comp_decription"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">OD</label>
                        <input type="text" class="form-control" name="comp_od"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">ID</label>
                        <input type="text" class="form-control" name="comp_id"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">TJ</label>
                        <input type="text" class="form-control" name="comp_tj"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Weight</label>
                        <input type="text" class="form-control" name="comp_weight"
                     required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Length</label>
                        <input type="text" class="form-control" name="comp_length"
                        required>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            </form>
        </div>
    </div>
</div>
{{----Add modal----}}

{{----Add Section modal----}}
<div class="modal fade" id="addSectionModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="{{ route('admin.drillstring.store') }}" method="post">
            @csrf
                <input type="hidden" name="projectId" value="{{ session()->get('projectId') }}">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">+ Add {{ __('Drillstring Section') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row gy-3">
                        <div class="col-md-9">
                            <label for="" class="form-label">Description</label>
                            <input type="text" class="form-control" name="decription" value="BHA#1"
                            required>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-primary m-t-17">Submit</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
{{----Add Section modal----}}

{{----Edit Section modal----}}
<div class="modal fade" id="editSectionModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="{{ route('admin.drillstring.update') }}" method="post">
            @csrf
                <input type="hidden" name="DS_ID" value="{{ $dsInfo->DS_ID }}">
                <div class="modal-header">
                    <h5 class="modal-title" id="editSectionModalLabel">Edit {{ __('Drillstring Section') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row gy-3">
                        <div class="col-md-9">
                            <label for="" class="form-label">Description</label>
                            <input type="text" class="form-control" name="description" value="{{$dsInfo->Description}}"
                            required>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-primary m-t-17">Submit</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
{{----Edit Section modal----}}

{{-----Delete Section modal-----}}
<div class="modal fade" id="deleteSectionModal" data-bs-backdrop="static"
    data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
        <div class="modal-body">
        <form action="{{ route('admin.drillstring.destroy') }}" method="post">
            @csrf
            <input type="hidden" name="DS_ID" value="{{ $dsInfo->DS_ID }}">
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
{{-----Delete Section modal-----}}
@endsection
