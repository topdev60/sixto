$(document).ready(function () {
    $('select#selectedDrillstringId').on('change', function () {
        $('#selectDsDesc').submit();
    })

    $('#tfa_checkbox').on('change', function () {
        if($(this).is(':checked')){
            $('.nozzletable').hide();
        }else{
            $('.nozzletable').show();
        }
    })

    $('#update_btn').on('click', function () {
        var selectedDrillstringId = $('#selectedDrillstringId').val();
        var selectedBitType = $('#selectedBitType').val();
        var position = $('#inputPosition').val();
        var size = $('#inputSize').val();
        var tfain2 = $('#tfain2').val();
        var n_0_n = $('input[name="N0_N"]').val();
        var n_0_size = $('input[name="N0_SIZE"]').val();
        var n_1_n = $('input[name="N1_N"]').val();
        var n_1_size = $('input[name="N1_SIZE"]').val();
        var n_2_n = $('input[name="N2_N"]').val();
        var n_2_size = $('input[name="N2_SIZE"]').val();
        $.ajax({
            data:{
                'ds_id': selectedDrillstringId,
                'bit_type': selectedBitType,
                'position': position,
                'size': size,
                'tfa': tfain2,
                'N0_N': n_0_n,
                'N0_SIZE': n_0_size,
                'N1_N': n_1_n,
                'N1_SIZE': n_1_size,
                'N2_N': n_2_n,
                'N2_SIZE': n_2_size,
            },
            type: 'POST',
            url: '/drillStringUpdate',
            dataType: 'json',
            success: function (response) {
                location.reload();
            }
        })
    })

    $('select#selectDrillstring').on('change', function () {
        $('#drillsForm').submit();
    });
    
    $('#wellboreUpdateBtn').on('click', function () {
        $('#wellboreUpdateForm').submit();
    });
})