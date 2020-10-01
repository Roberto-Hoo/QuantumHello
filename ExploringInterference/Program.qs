namespace ExploringInterference {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    
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
            return ResultadoDaMedida;
        }
    }
}