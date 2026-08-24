# Ajustes para a atividade de equivalência formal

Foram adicionados sem remover o fluxo anterior de simulação/síntese/sweep.

## O que mudou

1. `synth/formality_synth.tcl`
   - faz uma síntese dedicada ao Formality diretamente a partir do RTL;
   - executa `set_svf` imediatamente antes de `compile_ultra`;
   - mantém o SVF ativo até a geração da netlist;
   - gera um par inseparável `netlist + SVF` por modo;
   - não usa o cache DDC do sweep, evitando misturar guidance de rodadas diferentes.

2. `synth/vending.sdc`
   - agora é autocontido e pode ser lido diretamente com `read_sdc`;
   - mantém clock de 20 ns, uncertainty de 0,5 ns, I/O delay de 3 ns, carga e driver SAED32.

3. `fm/formality.tcl`
   - carrega a mesma `.db` da síntese;
   - faz `set_svf` antes de qualquer `read_verilog`;
   - define `set synopsys_auto_setup true` logo depois;
   - lê RTL como golden e netlist como revision;
   - executa `match`, `verify` e gera reports de accepted/rejected, matched/unmatched, passing/failing e status;
   - registra tempo de execução;
   - permite `match -certain` opcional via `FORMALITY_MATCH_CERTAIN=1`.

4. `Makefile`
   - novos alvos: `formal_synth`, `formal_no_autoungroup`, `formal_autoungroup`, `formal_verify`, `formal`, `formal_mk_scripts`, `clean_formal`.

5. `fm/README.md`
   - passo a passo de execução e depuração.

## Artefatos esperados após `make formal_synth`

Rodada principal (`-no_autoungroup`):
- `synth/reports/default.svf`
- `synth/vending_top_netlist.v`

Aliases para comparação:
- `synth/reports/default_grouped.svf`
- `synth/vending_top_netlist_grouped.v`

Rodada sem `-no_autoungroup`:
- `synth/reports/default_ungrouped.svf`
- `synth/vending_top_netlist_ungrouped.v`

## Comandos

```bash
make formal_synth
make formal_no_autoungroup
make formal_autoungroup
```

ou tudo de uma vez:

```bash
make formal
```
