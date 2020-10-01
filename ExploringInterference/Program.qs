namespace ExploringInterference {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    
   
   // operation TestInterference2() : Unit {
   //     using (q = Qubit()) {
   //         X(q);
   //         H(q);
   //         DumpMachine();
   //         Reset(q);
   //     }
   // }

    
    @EntryPoint()
    operation TestInterference1() : Result {
        using (q = Qubit()) {
            Message(" ");
            Message("At the beginning the qubit is in the state |0>.");
            DumpMachine();
            H(q);
            Message(" ");
            Message("After applying H the qubit is in a uniform superposition. 50% |0> e 50% |1>");
            DumpMachine();
            H(q);
            Message(" ");
            Message("If we apply H again, interference gives back the state to |0>.");
            DumpMachine();
            Message(" ");
            Message("If we measure we always obtain 'Zero'.");
            let ResultadoDaMedida = M(q);
            Reset(q);
            // X|0> =|1>; H X |0> = H|1> = (|0>-|1>)/sqrt(2)
            //You see that the phase for the state |1⟩ is π  radians. You see this phase because 
            //the negative numbers in the complex plane are in the negative part of the x-axis. T
            //The result is π  radians in polar coordinates. Although the phase is nonzero, 
            //the probabilities remain the same.
            X(q);
            H(q);
            Message("H(X(q))=(|0>-|1>)/sqrt(2); a fase do estado |1> é pi radianos");
            DumpMachine();
            Reset(q);
            Y(q);
            H(q);
            Message("H(Y(q))= i(|0>-|1>)/sqrt(2);");
            Message(" a fase do estado |0> é pi/2 radianos e a fase de |1> é -pi/2 radianos");
            DumpMachine();
            Reset(q);
            return ResultadoDaMedida;
        }
    }
}