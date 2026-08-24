# Ajustes finais do framework de síntese lógica

Esta revisão fecha os pontos metodológicos identificados na comparação com o Design Compiler User Guide e os slides de treinamento:

1. **Sweep com DDC reuse** — `analyze/elaborate/link/check_design` uma vez; cada ponto usa `read_ddc` e reaplica constraints.
2. **Retiming controlado** — no máximo um `compile_ultra -retime` por run; com segundo passe, retiming fica no incremental.
3. **SVF por fronteira de transformação** — síntese única: RTL→mapped; sweep: RTL→unmapped base e unmapped→mapped por run.
4. **Min/max correto** — min library ligada com `set_min_library`, sem adicioná-la à target/link; operating conditions max/min obrigatórias quando o modo min/max é ativado.
5. **Power com atividade real** — preset `power` usa clock gating e, se `SAIF` for fornecido, ativa `read_saif`, `set_dynamic_optimization true` e `report_saif`.
6. **Sanidade pós-compile** — `check_design_post.rpt` habilitado por default.
7. **CSV de QoR ampliado** — setup/hold, área, power, runtime, DRC, `timing_status` e `qor_status`.
8. **Compatibilidade corrigida** — `dc_setup.tcl` agora carrega os utilitários/features necessários antes da tecnologia.

O fluxo continua sendo **síntese lógica**. Recursos de physical/topographical synthesis (`-spg`, NDM/Milkyway, TLU+, floorplan) permanecem fora do escopo por projeto.
