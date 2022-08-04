<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Drillstring;
use App\Models\Surfpiping;
use App\Models\WellBore;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class WellboreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'Wellbore';
    public function index()
    {
        //
        $selectedProjectId = Session::get('projectId');
        $wellbore = WellBore::where('ProjectID', $selectedProjectId)->get();
        $drillstring = Drillstring::where('ProjectID', $selectedProjectId)->get();
        $surfPiping = Surfpiping::where('ProjectID', $selectedProjectId)->get();
        if (Auth::user()->role == 1) {
            return view('Backend.Wellbore.index')->with('module', $this->module)
                ->with('wellbore', $wellbore)
                ->with('drillstring', $drillstring)
                ->with('surfpiping', $surfPiping);
        }else {
            return view('Frontend.Wellbore.index')->with('module', $this->module)
                ->with('wellbore', $wellbore)
                ->with('drillstring', $drillstring)
                ->with('surfpiping', $surfPiping);
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
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function show(WellBore $wellBore)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function edit(WellBore $wellBore)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, WellBore $wellBore)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function destroy(WellBore $wellBore)
    {
        //
    }
}
