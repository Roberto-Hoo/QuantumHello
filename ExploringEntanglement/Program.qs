namespace ExploringEntanglement {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation TestEntanglement1() : Result[] {
        using (qubits = Qubit[2]) {
            Message("Estado inicial:");
			   DumpMachine();
            H(qubits[0]);
            Message("\nAplicada Hadamard no 1° qbit");
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