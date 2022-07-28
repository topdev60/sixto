<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\WellInfo;
use Illuminate\Support\Facades\Session;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'Projects';
    public function index()
    {
        if(Session::has('projectId')){
            $selectedProject = WellInfo::find(Session::get('projectId'));
        }
        if(Auth::user()->role == 1){
            $projects = WellInfo::all();
            return view('Backend.Project.index')->with('projects', $projects)->with('module', $this->module)->with('selectedProject', $selectedProject);
        }else {
            $projects = WellInfo::where('UserID', Auth::id())->get();
            return view('Frontend.Project.index')->with('projects', $projects)->with('module', $this->module)->with('selectedProject', $selectedProject);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $wellinfo = WellInfo::create([
            'UserID' => Auth::id(),
            'project_name' => $request->name,
            'location' => $request->location,
            'field' => $request->field,
            'lease' => $request->lease,
            'operator' => $request->operation,
            'rigcontroller' => $request->rig_controller,
            'wellname' => $request->well_name,
            'rigname' => $request->rig_name,
            'rigtype' => $request->rig_type,
        ]);

        if($wellinfo){
            $output = 'Successed Create Project';
        }else {
            $output = 'Failed Create Project';
        }

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        //
        $wellinfo = WellInfo::where('UserID', Auth::id())->where('ProjectID', $request->id)->update([
            'project_name' => $request->name,
            'location' => $request->location,
            'field' => $request->field,
            'lease' => $request->lease,
            'operator' => $request->operation,
            'rigcontroller' => $request->rig_controller,
            'wellname' => $request->well_name,
            'rigname' => $request->rig_name,
            'rigtype' => $request->rig_type,
        ]);

        if($wellinfo){
            $output = 'Successed Create Project';
        }else {
            $output = 'Failed Create Project';
        }

        return redirect()->back();
    }

    /**
     * 
     * @param int $ProjectID
     * 
     */

    public function selectproject($id){
        Session::put('projectId', $id);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        if(Auth::user()->role == 1){
            WellInfo::where('ProjectID', $request->id)->delete();
        }else {
            WellInfo::where('UserID', Auth::id())->where('ProjectID', $request->id)->delete();
        }
        Session::forget('projectId');
        return redirect()->back();
    }
}
