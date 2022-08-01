<?php

namespace App\Http\Controllers;

use App\Models\Fgpressure;
use App\Models\Lithology;
use App\Models\Popressure;
use App\Models\Temperature;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class FormationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $module = 'Formation';
        $selectedProjectId = Session::get('projectId');
        $porepressure = Popressure::where('ProjectID', $selectedProjectId)->paginate(10);
        if(Auth::user()->role == 1){
            return view('Backend.Formation.SubTabs.porepressure')->with('porepressure', $porepressure)->with('module', $module)->with('tab', 1);
        }else {
            return view('Frontend.Formation.SubTabs.porepressure')->with('porepressure', $porepressure)->with('module', $module)->with('tab', 1);
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
        $temp = Temperature::insert([
            'ProjectID' => Session::get('projectId'),
            'TVD' => $request->tvd,
            'TG' => $request->tg,
            'Temperature' => $request->temperature,
        ]);
        if ($temp) {
            return redirect()->back();
        }else {
            return 'Error';
        }
    }
    
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $selectedProjectId = Session::get('projectId');
        switch ($slug) {
            case 'porepressure':
                $porepressure = Popressure::where('ProjectID', $selectedProjectId)->paginate(10);
                if(Auth::user()->role == 1){
                    return view('Backend.Formation.SubTabs.porepressure')->with('porepressure', $porepressure)->with('module', 'Formation')->with('tab', 1);
                }else {
                    return view('Frontend.Formation.SubTabs.porepressure')->with('porepressure', $porepressure)->with('module', 'Formation')->with('tab', 1);
                }
                break;
            case 'fracture':
                $fgpressure = Fgpressure::where('ProjectID', $selectedProjectId)->paginate(10);
                if(Auth::user()->role == 1){
                    return view('Backend.Formation.SubTabs.fracture')->with('fgpressure', $fgpressure)->with('module', 'Formation')->with('tab', 2);
                }else {
                    return view('Frontend.Formation.SubTabs.fracture')->with('fgpressure', $fgpressure)->with('module', 'Formation')->with('tab', 2);
                }
                break;
            case 'formation':
                $temperatures = Temperature::where('ProjectID', $selectedProjectId)->paginate(10);
                if(Auth::user()->role == 1){
                    return view('Backend.Formation.SubTabs.formation')->with('temperatures', $temperatures)->with('module', 'Formation')->with('tab', 3);
                }else {
                    return view('Frontend.Formation.SubTabs.formation')->with('temperatures', $temperatures)->with('module', 'Formation')->with('tab', 3);
                }
                break;
            case 'lithology':
                $lithologies = Lithology::where('ProjectID', $selectedProjectId)->paginate(10);
                if(Auth::user()->role == 1){
                    return view('Backend.Formation.SubTabs.lithology')->with('lithologies', $lithologies)->with('module', 'Formation')->with('tab', 4);
                }else {
                    return view('Frontend.Formation.SubTabs.lithology')->with('lithologies', $lithologies)->with('module', 'Formation')->with('tab', 4);
                }
                break;
            default:
                $porepressure = Popressure::where('ProjectID', $selectedProjectId)->paginate(10);
                if(Auth::user()->role == 1){
                    return view('Backend.Formation.SubTabs.porepressure')->with('porepressure', $porepressure)->with('module', 'Formation')->with('tab', 1);
                }else {
                    return view('Frontend.Formation.SubTabs.porepressure')->with('porepressure', $porepressure)->with('module', 'Formation')->with('tab', 1);
                }
                break;
        }
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
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request->id;
        Temperature::where('TempID', $id)->delete();
        return redirect()->back();
    }
}
