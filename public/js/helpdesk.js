function announcement() {
  let curDay = new Date();
  let curTime = new Date().getHours();
  let curDay1 = curDay.toISOString().slice(0, 10);
  let curDay2 = '*' + curDay1.slice(curDay1.length - 6);

  // console.log(curDay.getDay());
  if (curTime < 7 || curTime > 19) {
    $.notify({
      icon: "warning",
      message: "IT Technicians are only available between 7AM-7PM. <br>For urgent concerns please email tech support at tech-support@neda.gov.ph"
    }, {
      type: 'warning',
      timer: 30000,
      placement: {
        from: 'top',
        align: 'right'
      }
    });
  } else if (holidayDays.includes(curDay1) || holidayDays.includes(curDay2)) {
    $.notify({
      icon: "warning",
      message: "IT Technicians are only available during business days. <br>For urgent concerns please email tech support at tech-support@neda.gov.ph"
    }, {
      type: 'warning',
      timer: 30000,
      placement: {
        from: 'top',
        align: 'right'
      }
    });
  } else if (curDay.getDay() == 6 || curDay.getDay() == 0) {
    $.notify({
      icon: "warning",
      message: "IT Technicians are only available Mondays to Fridays. <br>For urgent concerns please email tech support at tech-support@neda.gov.ph"
    }, {
      type: 'warning',
      timer: 30000,
      placement: {
        from: 'top',
        align: 'right'
      }
    });
  }
}

function showCssLoader(myBtnId) {
  if($('#' + myBtnId).length) {
    $('#' + myBtnId).attr('disabled', true);
  }
  if($('#CssLoader').length) {
    $("#CssLoader").attr("hidden", false);
  }
}

function ocmaincategory() {
  if ($('#main_category').val() != '') {
    $("#divCategory").attr("hidden", false);
    $("#category_id").empty();
    
    let cats = categories.map((item, index) => item.main_id == $('#main_category').val() ? item : '').filter(String);
    // console.log(cats);
    cats.forEach(function(data) {
      $("#category_id").append('<option value="' + data.id + '">' + data.name + '</option>');
    });
    $("#category_id").selectpicker("refresh");
  } else {
    $("#divCategory").attr("hidden", true);
  }
}

function occategory() {
  let catIndex = categories.findIndex(item => item.id == $('#category_id').val());
  if (catIndex != -1) {
    if($('#input-work_days').length) {
      $("#input-work_days").val(categories[catIndex].man_day);
    }
  } else {
    if($('#input-work_days').length) {
      $("#input-work_days").val();
    }
  }
}