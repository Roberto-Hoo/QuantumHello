namespace Quantum.QuantumHello {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    // Entrada:void
    // Saída:Unit=void
    // @EntryPoint()
    operation NomeDoMetodoHelloQuantum () : Unit {
        Message("Olá Roberto !! Hello quantum world!");
    }
    //In this module, you'll work with the Result type. 
    //A Result represents the result of a qubit measurement and 
    //can have one of two possible values: One and Zero.

    //Allocating qubits
    //In Q#, to obtain a qubit you use the 'using' keyword. You can allocate one or many qubits at a time.

    //Here's an example that allocates one qubit:
    //Every qubit you allocate with the using keyword starts in the zero state
    //To measure a qubit, you use the 'M' operation. After you measure a qubit, you need to use the 'Reset'' 
    //operation to place the qubit back in the zero state. The Microsoft.Quantum.Intrinsic library provides
    //both of these operations.
    //To simplify the process, you can use the 'MResetZ'  operation. This operation combines M and Reset as one operation.
    //The Microsoft.Quantum.Measurement library provides the MResetZ operation. 
    //One operation you'll use later is the H operation. Think of the H operation as a way of putting 
    //a qubit into an even(par) superposition. 
    //Once in superposition, a qubit has a 50% chance of being measured as zero or one.
     
    //Entrada: void
    //Saída: Result
    //The Result type represents the result of a measurement and can have two possible values: Zero and One.
    
    @EntryPoint()
    operation GenerateRandomBit() : Result {
        // Allocate a qubit.
        using (QuantumBit = Qubit()) {
            // Put the qubit to superposition.
            H(QuantumBit);
            // It now has a 50% chance of being measured 0 or 1.
            // Measure the qubit value.
            let ResultadoDaMedida = M(QuantumBit);
            //return MResetZ(QuantumBit)
            Reset(QuantumBit);
            return ResultadoDaMedida;
        }
	 }
}
