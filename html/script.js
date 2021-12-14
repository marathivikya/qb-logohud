$(document).ready(function () {
  $("#page").hide();
});

window.addEventListener("message", function (event) {
  var edata = event.data;

  if (edata.type == "toggle") {
    if (edata.value) {
      $("#page").show();
    } else {
      $("#page").hide();
    }
  }

  if (edata.type == "update") {
    $("#page").show();
    $("#u720-4").text(edata.online);
    $("#u753-4").text(edata.id);
    $("#u762-4").text(edata.money);
    $("#u771-4").text(edata.bank);
    $("#u780-4").text(edata.playtime);
    $("#u111-6").text(edata.date);
  }
});

$(document).on("keydown", function () {
  if (event.repeat) {
    return;
  }
  switch (event.keyCode) {
    case 75: // K
      $("#page").hide();
      break;
    case 75: // K
      $("#page").show();
      break;
    case 75: // K
      ControlPressed = true;
      break;
  }
});
