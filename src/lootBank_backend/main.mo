import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank{
stable var currentValue:Float = 300;
 
 var startTime = Time.now();
 Debug.print(debug_show(startTime));

public func topUp(amount:Float){
  currentValue += amount;
  Debug.print(debug_show(currentValue));
};

public query func checkBalance():async Float{
  return currentValue;
};
 
public func compound(){
  let currentTime = Time.now();
  let timeElapsedNs = currentTime - startTime;
  let timeElapsedS = timeElapsedNs/1000000000;
Debug.print(debug_show(timeElapsedS));
  currentValue:= currentValue*(1.01**Float.fromInt(timeElapsedS));

  startTime:=currentTime;
}

}
