@extends('Backend.layouts.app')
@section('content')
<section class="home-section" id="home-section">
    <div class="container-fluid">
        {{---title---}}
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
                {{$module}}
            </div>
            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#addModal"> +Add {{$module}} </button>
        </div>
        {{---title---}}
        <div class="row gy-4">
            <div class="col-md-12 col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <div>{{$module}} Table</div>
                    </div>
                    <div class="card-body overflow-auto">
                        <table id="dataTable" class="table table-responsive">
                            <thead>
                                <tr>
                                    <th><i class="fas fa-grip-vertical"></i></th>
                                    <th class="text-center">#</th>
                                    <th class="text-center">{{__('Project Name')}}</th>
                                    <th class="text-center">{{__('Location')}}</th>
                                    <th class="text-center">{{__('Field')}}</th>
                                    <th class="text-center">{{__('Lease')}}</th>
                                    <th class="text-center">{{__('Operation')}}</th>
                                    <th class="text-center">{{__('Rig Name')}}</th>
                                    <th class="text-center">{{__('Rig Type')}}</th>
                                    <th class="text-center">{{__('Rig Controller')}}</th>
                                    <th class="text-center">{{__('Well Name')}}</th>
                                    <th class="text-center">{{__('Action')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($projects as $project)
                                <tr>
                                    <td>
                                        <a href="{{route('user.project.selectProject', $project->ProjectID)}}">
                                            <i class="far fa-square"></i>
                                        </a>
                                    </td>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$project->project_name}}</td>
                                    <td>{{$project->location}}</td>
                                    <td>{{$project->field}}</td>
                                    <td>{{$project->lease}}</td>
                                    <td>{{$project->operator}}</td>
                                    <td>{{$project->rigname}}</td>
                                    <td>
                                        @if ($project->rig_type == '1' || $project->rig_type == 1)
                                            <span class="badge bg-success text-primary">Yes</span>
                                        @else
                                            <span class="badge bg-danger">No</span>
                                        @endif
                                    </td>
                                    <td>{{$project->rigcontroller}}</td>
                                    <td>{{$project->wellname}}</td>
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                              data-bs-target="#delete{{$project->ProjectID}}">
                                              <i class="fas fa-trash"></i>
                                            </button>
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                              data-bs-target="#editModal{{$project->ProjectID}}">
                                              <i class="fas fa-pencil-alt"></i>
                                            </button>
                                        </div>
                                        {{-- delete modal --}}
                                        <div class="modal fade" id="delete{{ $project->ProjectID }}" data-bs-backdrop="static"
                                            data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                                            aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                <form action="{{ route('user.project.destroy') }}" method="post" id="delete{{ $project->ProjectID }}">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{ $project->ProjectID }}">
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
                                        <div class="modal fade" id="editModal{{ $project->ProjectID }}" data-bs-backdrop="static"
                                            data-bs-keyboard="false" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-lg">
                                            <div class="modal-content">
                                                <form action="{{ route('user.project.update') }}" method="post">
                                                @csrf
                                                <input type="hidden" name="id" value="{{ $project->ProjectID }}">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editModalLabel">Edit {{ __('Project') }}</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row gy-3">
                                                    <div class="col-md-6">
                                                        <label for="" class="form-label">Project Name</label>
                                                        <input type="text" class="form-control" name="name" value="{{ $project->project_name }}"
                                                        required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="" class="form-label">Location</label>
                                                        <input type="text" class="form-control" name="location" value="{{ $project->location }}"
                                                        required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="" class="form-label">Field</label>
                                                        <input type="text" class="form-control" name="field" value="{{ $project->field }}"
                                                        required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="" class="form-label">Lease</label>
                                                        <input type="text" class="form-control" name="lease" value="{{ $project->lease }}"
                                                        required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="" class="form-label">Operation</label>
                                                        <input type="text" class="form-control" name="operation"
                                                        value="{{ $project->operator }}" required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="" class="form-label">Rig Name</label>
                                                        <input type="text" class="form-control" name="rig_name" value="{{ $project->rigname }}"
                                                        required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="" class="form-label">Rig Type</label>
                                                        <input type="text" class="form-control" name="rig_type" value="{{ $project->rigtype }}"
                                                        required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="" class="form-label">Rig Controller</label>
                                                        <input type="text" class="form-control" name="rig_controller"
                                                        value="{{ $project->rigcontroller }}" required>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label for="" class="form-label">Well Name</label>
                                                        <input type="text" class="form-control" name="well_name"
                                                        value="{{ $project->wellname }}" required>
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
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <div class="bg-secondary rounded p-3">
                  DIV PLOT
                </div>
            </div>
        </div>
    </div>
    <!-- Add Modal -->
<div class="modal fade" id="addModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="{{ route('user.project.store') }}" method="post">
            @csrf
            <input type="hidden" name="user_id" value="{{ 'Auth::user()->id' }}">
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">+ Add {{ __('$module') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row gy-3">
                <div class="col-md-6">
                    <label for="" class="form-label">Project Name</label>
                    <input type="text" class="form-control" name="name" required>
                </div>
                <div class="col-md-6">
                    <label for="" class="form-label">Location</label>
                    <input type="text" class="form-control" name="location" required>
                </div>
                <div class="col-md-6">
                    <label for="" class="form-label">Field</label>
                    <input type="text" class="form-control" name="field" required>
                </div>
                <div class="col-md-6">
                    <label for="" class="form-label">Lease</label>
                    <input type="text" class="form-control" name="lease" required>
                </div>
                <div class="col-md-6">
                    <label for="" class="form-label">Operation</label>
                    <input type="text" class="form-control" name="operation" required>
                </div>
                <div class="col-md-6">
                    <label for="" class="form-label">Rig Name</label>
                    <input type="text" class="form-control" name="rig_name" required>
                </div>
                <div class="col-md-6">
                    <label for="" class="form-label">Rig Type</label>
                    <input type="text" class="form-control" name="rig_type" required>
                </div>
                <div class="col-md-6">
                    <label for="" class="form-label">Rig Controller</label>
                    <input type="text" class="form-control" name="rig_controller" required>
                </div>
                <div class="col-md-6">
                    <label for="" class="form-label">Well Name</label>
                    <input type="text" class="form-control" name="well_name" required>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            </form>
        </div>
    </div>
</div>
</section>
@endsection
