import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  
  stable var currentValue: Float = 300;
  //currentValue:=300;

  stable var startTime = Time.now();
  //startTime:= Time.now();

  //Update Method
 
  public func topUp(amount: Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    let temp: Float = currentValue - amount;
    if(temp >= 0){
    currentValue-=amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Not enough amount in the account");
      //Debug.print("Amount in the account:" + debug_show(currentValue));
    }
  };

  //Query Method

  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedinNS = (currentTime-startTime);
    let timeElapsedinS = timeElapsedinNS/1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedinS));
    startTime := currentTime;
  };
}
