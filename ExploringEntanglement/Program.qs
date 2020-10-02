namespace ExploringEntanglement {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    

    @EntryPoint()
    operation TestEntanglement1() : Result[] {
        using (qubits = Qubit[2]) {
            let alfa = 0.4;
            Message("Estado inicial:");
			   DumpMachine();
				Ry(2.0 * ArcCos(Sqrt(alfa)), qubits[1]);
            DumpMachine();
            H(qubits[0]);
            Message("\nAplicada Hadamard no qbit(0)");
            DumpMachine();
            CNOT(qubits[0], qubits[1]);
            Message("\nEntangled state before measurement:");
            DumpMachine();
            Message(" ");
            let results = MultiM(qubits);
            Message("State after measurement:");
            DumpMachine();
            return results;
        }
    }
}