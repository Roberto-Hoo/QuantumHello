﻿namespace ExploringEntanglement {
    open Microsoft.Quantum.Canon;  open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;  open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;  open Microsoft.Quantum.Convert;
    
    @EntryPoint()
    operation TestEntanglement1() : Result {
        let alfa = 0.3;       
        using (qbit = Qubit[3]) {
            Message("Estado inicial:");
			   DumpMachine();
            Message("\nColocado o qubit[2] no estado sqrt(0.3)|0> + sqrt(0.7)|1>");
				Rx(2.0 * ArcCos(Sqrt(alfa)), qbit[2]);
            DumpMachine(); 
            H(qbit[0]);
            Message("\nAplicada Hadamard no qbit[0]");
            DumpMachine();
            H(qbit[1]);
            Message("\nAplicada Hadamard no qbit[1]");
            DumpMachine();             
            CNOT(qbit[0], qbit[1]);
            Message("\nAplicando a porta CNOT nos qbit(0) e qbit(1)");
            DumpMachine();
            CCNOT(qbit[0], qbit[1],qbit[2]);
            Message("\nAplicando a porta CNOT nos qbit(0), qbit(1) e qbit(3)");
            DumpMachine();          
            let resultado = MResetZ(qbit[2]);
            Message("\nEstado após a medição:");
            DumpMachine(); Reset(qbit[0]); Reset(qbit[1]);
            return resultado;
        }
    }
}
