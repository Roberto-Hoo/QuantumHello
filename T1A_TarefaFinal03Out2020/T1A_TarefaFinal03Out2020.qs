namespace ExploringEntanglement {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    @EntryPoint()
    operation TestEntanglement1() : Result[] {
        using (qbit = Qubit[2]) {
            let alfa = 0.4;
            Message("Estado inicial:");
			   DumpMachine();
            
            Message("\nColocado o qubit[1] no estado sqrt(0.4)|0> + sqrt(0.6)|1> ");
				Ry(2.0 * ArcCos(Sqrt(alfa)), qbit[1]);
            DumpMachine();

            H(qbit[0]);
            Message("\nAplicada Hadamard no qbit(0)");
            DumpMachine();
            
            CNOT(qbit[0], qbit[1]);
            Message("\nAplicando a porta CNOT a ambos qbits:");
            DumpMachine();
            
            let medida = MultiM(qbit);
            Message("\nEstado após a medição:");
            DumpMachine();

            return medida;
        }
    }
}