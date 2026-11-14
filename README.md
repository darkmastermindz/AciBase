# AciBase
TI-83/84 Plus BASIC Science Program (Chemistry)

This simple, easy program helps calculate pH, pOH, [OH-], and [H+] for acid and base problems. 
It also helps you show your work.

# Calculations
**Main menu**
- **pH / pOH / OH- / H3O+**: enter any one and get the other three.

**More... menu** (new in v4.0). Each one shows a work screen with the formula it used, then the standard pH/pOH/[OH-]/[H+] summary.
- **Weak Acid**: Ka and initial [HA] → [H+] from `Ka = x²/(C−x)` (solved exactly with the quadratic formula), pH, and % ionization.
- **Weak Base**: Kb and initial [B] → [OH-] from `Kb = x²/(C−x)`, pOH/pH, and % ionization.
- **Ka/Kb Conv**: Ka or Kb → the conjugate constant (`Ka·Kb = Kw`), pK, and the conjugate pK.
- **Buffer (H-H)**: Ka, [A-], [HA] → pH from Henderson–Hasselbalch, `pH = pKa + log([A-]/[HA])`.
- **Titration**: strong acid + strong base (M and mL of each) → mmol H+ and OH-, total volume, equivalence volume, and the pH of the mixture. Water autoionization is included, so you get pH 7 exactly at equivalence.

All calculations assume 25 °C (Kw = 1.0×10⁻¹⁴) and monoprotic acids and bases.

# Screenshots
![Demo](https://media.giphy.com/media/fxO5yvadOtqJhJqb5v/giphy.gif)

# Releases
**Version 4.0 (Unreleased, in development)**
- Adds the More... menu: weak acid, weak base, Ka/Kb conversion, buffer, and titration
- Fixes the OH- input loop

**Version 3.17**
- [https://www.ticalc.org/archives/files/fileinfo/459/45997.html](https://www.ticalc.org/archives/files/fileinfo/459/45997.html)
- Release Date: `Sat Jun 7 23:09:44 2014`
- File Size: `5,483 bytes`
- SHA-256: `9faae7ee415a280d3a4b69f78deb76f2b727f0b09d2fc8d84a98f84be20a0075`

# Authors
- [Hansel Wei](https://github.com/darkmastermindz)
- [Zach Gainer](https://github.com/chaosinalunchbox)
