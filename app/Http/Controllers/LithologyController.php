<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Lithology;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class LithologyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $temp = Lithology::insert([
            'ProjectID' => Session::get('projectId'),
            'Description' => $request->description,
            'MD' => $request->md,
            'TVD' => $request->tvd,
            'TC' => $request->tc,
            'SH' => $request->sh,
        ]);
        if ($temp) {
            return redirect()->back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Lithology  $lithology
     * @return \Illuminate\Http\Response
     */
    public function show(Lithology $lithology)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Lithology  $lithology
     * @return \Illuminate\Http\Response
     */
    public function edit(Lithology $lithology)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Lithology  $lithology
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Lithology $lithology)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Lithology  $lithology
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request->id;
        Lithology::where('LithoID', $id)->delete();
        return redirect()->back();
    }
}
