# Presets de síntese lógica

Os presets configuram uma base de features. `features.tcl` é carregado depois e pode sobrescrever qualquer `ENABLE_*`.

| Preset | Objetivo | Estratégia principal |
|---|---|---|
| `default` | Baseline reproduzível | `compile_ultra`, gates de sanidade e reports completos |
| `fast` | Exploração rápida | Menos reports/arquivos secundários |
| `timing` | Timing | `create_auto_path_groups -mode mapped` + incremental |
| `aggressive_timing` | Timing de maior esforço | `timing` + critical range + **um único** passe com `-retime` |
| `area` | Área | Incremental + `optimize_netlist -area` |
| `power` | Potência | `-gate_clock`; se `SAIF` for fornecido, ativa também `read_saif` + `set_dynamic_optimization true` |

## Exemplos

```bash
make presets
make synth PRESET=default
make synth PRESET=timing PERIOD=8
make synth PRESET=aggressive_timing PERIOD=8
make synth PRESET=area
make synth PRESET=power
make synth PRESET=power SAIF=sim/vending.saif SAIF_INSTANCE=tb_vending/dut
```

No `aggressive_timing`, o fluxo nunca executa dois `compile_ultra -retime` no mesmo run. Quando há segundo passe, o primeiro compile é normal e o retiming fica reservado ao incremental. O SVF permanece ativo durante a cadeia de transformação.

No `power`, sem SAIF o preset funciona como exploração de clock gating e `report_power`. Com SAIF, a atividade real é anotada e a otimização dinâmica é habilitada. O CSV passa a registrar potência dinâmica, leakage e total em µW.
