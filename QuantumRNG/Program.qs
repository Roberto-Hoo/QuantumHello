namespace QuantumRNG {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;

//Let's take a moment to review the new code.
//Recall that we need to calculate the number of bits we need to express integers up to max. The Microsoft.Quantum.Math library provides the BitSizeI  function to accomplish this.
//The SampleRandomNumberInRange operation uses a repeat loop to generate random numbers until it generates one that's equal to or less than max.
//The for loop inside repeat works exactly the same as a for loop in other programming languages.
//In this example, output and bits are mutable variables. A mutable variable is one that can change during the computation. You use the set directive to change a mutable variable's value.
//The ResultArrayAsInt  function comes from the Microsoft.Quantum.Convert library. This function converts the bit string to a positive integer.

   //Entrada: void
   //Saída: Result
   //The Result type represents the result of a measurement and can have two possible values: Zero and One.    
   operation GenerateRandomBit() : Result {
        // Allocate a qubit.
        using (q = Qubit()) {
            // Put the qubit to superposition.
            H(q);
            // It now has a 50% chance of being measured 0 or 1.
            // Measure the qubit value.
            return MResetZ(q);
        }
    }

    operation SampleRandomNumberInRange(min :Int, max : Int) : Int {
        mutable output = 0; 
        repeat {
            mutable bits = new Result[0]; 
            for (n in 1..BitSizeI(max)) {
                set bits += [GenerateRandomBit()]; 
            }
            set output = ResultArrayAsInt(bits);
			} until ((output >= min) and (output <= max));
        
        return output;
    }

    @EntryPoint()
    operation SampleRandomNumber() : Int {
        let min = 10;
        let max = 60;
        Message($"Sampling a random number between {min} and {max}: ");
        return SampleRandomNumberInRange(min,max);
    }
}