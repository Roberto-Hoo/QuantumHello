namespace ExploringSuperposition {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    operation GenerateSpecificState(alpha : Double) : Result {        
       using (q = Qubit()) {
            Ry(2.0 * ArcCos(Sqrt(alpha)), q);
            Message("The qubit is in the desired state.");
            Message("");
            DumpMachine();
            Message("");
            Message("Your skewed random bit is:");
            let ResultadoDaMedida = M(q);
            Reset(q);
            return ResultadoDaMedida;
       }
	 }

	 operation GenerateRandomBit(alpha : Double) : Result {
        // Allocate a qubit.
        using (QuantumBit = Qubit()) {
            // Put the qubit to superposition.
            //H(QuantumBit); // It now has a 50% chance of being measured 0 or 1.
				Ry(2.0 * ArcCos(Sqrt(alpha)), QuantumBit); // Probabilidades alpha de ser 0 e 1-alpha de ser 1           
            // Measure the qubit value.
            let ResultadoDaMedida = M(QuantumBit);
            //return MResetZ(QuantumBit)
            Reset(QuantumBit);
            return ResultadoDaMedida;
        }
	 }

    operation SampleRandomNumberInRange(min :Int, max : Int) : Int {
        mutable output = 0; 
        repeat {
            mutable bits = new Result[0]; 
            for (n in 1..BitSizeI(max)) {
                set bits += [GenerateRandomBit(0.5)]; 
            }
            set output = ResultArrayAsInt(bits);
			} until ((output >= min) and (output <= max));
        
        return output;
    }

    @EntryPoint()
    operation TesteGerandoEstadoEspecifico() : Result {
        mutable output = 0; 
        let ProbabilidadeEstadoZero = 0.9;        
        mutable bits = new Result[0]; 
		  for (n in 1..10) {
			  set bits = [GenerateRandomBit(ProbabilidadeEstadoZero)]; 
           set output = ResultArrayAsInt(bits);
           Message($"Medida = {output}");
        }        
        Message($"Probabilidade do estado ser Zero = {ProbabilidadeEstadoZero}: ");
        return GenerateSpecificState(ProbabilidadeEstadoZero);
    }
         
}