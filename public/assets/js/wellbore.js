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
        $.ajax({
            data:{
                'ds_id': selectedDrillstringId,
                'bit_type': selectedBitType,
                'position': position,
                'size': size,
                'tfa': tfain2,
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
    })
})