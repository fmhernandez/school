var TimeToFade = 1000.0;
//Varibale used to avoid the user interaction when the element is not showed
var fadeOut = 1;
function fade_element(eid)
{
  var element = document.getElementById(eid);
//When the element is not showed (fadeOut==0), we turn on the visibility property to allow the fade in effect.
if (fadeOut == 0){
        element.style.visibility = "visible";
        visible_value = "visible";
    }  
  if(element == null)
    return;
   
  if(element.FadeState == null)
  {
    if(element.style.opacity == null 
        || element.style.opacity == '' 
        || element.style.opacity == '1')
    {
      element.FadeState = 2;
    }
    else
    {
      element.FadeState = -2;
    }
  }
  if(element.FadeState == 1 || element.FadeState == -1)
  {
    element.FadeState = element.FadeState == 1 ? -1 : 1;
    element.FadeTimeLeft = TimeToFade - element.FadeTimeLeft;
  }
  else
  {
    element.FadeState = element.FadeState == 2 ? -1 : 1;
    element.FadeTimeLeft = TimeToFade;
    setTimeout("animateFade(" + new Date().getTime() + ",'" + eid + "')", 33);
  }
}   


function animateFade(lastTick, eid)
{      
  var curTick = new Date().getTime();
  var elapsedTicks = curTick - lastTick;
  
  var element = document.getElementById(eid);
 
  if(element.FadeTimeLeft <= elapsedTicks)
  {
    element.style.opacity = element.FadeState == 1 ? '1' : '0';
    element.style.filter = 'alpha(opacity = ' 
        + (element.FadeState == 1 ? '100' : '0') + ')';
    element.FadeState = element.FadeState == 1 ? 2 : -2;
    console.log(element.style.visibility);  
    //if we have finished the fade out effect, we set visibility to hidden, to avoid the user interaction, 
    //if not (fadeOut == 0) we turn on fadeOut to allow setting visibility to true in fade_element procedure.
    if (fadeOut == 1)
    {
        element.style.visibility = "hidden";
        visible_value = "hidden"
        fadeOut=0;
    } else{
        fadeOut=1;
    }
    //element.style.visibility = "hidden";        
    return;
  }
 
  element.FadeTimeLeft -= elapsedTicks;
  var newOpVal = element.FadeTimeLeft/TimeToFade;
  if(element.FadeState == 1)
    newOpVal = 1 - newOpVal;

  element.style.opacity = newOpVal;
  element.style.filter = 'alpha(opacity = ' + (newOpVal*100) + ')';
  
  setTimeout("animateFade(" + curTick + ",'" + eid + "')", 33);
}