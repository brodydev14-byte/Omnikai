-- Seed the premium sessions into premium_content.
--
-- One row per intermediate/advanced workout page, holding what used to be the
-- inner HTML of that page's .scroll-wrap. Lifted verbatim from the files by
-- script rather than retyped, so the rendered workouts are unchanged.
--
-- The HTML is dollar-quoted ($omnihtml$) because it is full of single and double
-- quotes and backticks; no file contains that tag (checked before generating).
-- Upserting on slug keeps this safe to re-run and makes a later content edit a
-- matter of re-seeding rather than a schema change.

insert into public.premium_content (slug, html) values
('bjj_advanced_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥋 BJJ · Advanced · Technique Focus</div>
      <div class="header-title">Advanced Session A</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥋 Drill 1 — Leg Lock Entries</div><div class="drill-card" id="leg-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Heel Hook and Kneebar Entries</div><div class="drill-status" id="legStatus" onclick="completeDrill('leg')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">8 each side</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Outside heel hook entry:</strong> From standing, level change and catch the outside leg — rotate your body to apply the heel hook by turning away from the leg</div><div class="tip-row"><div class="tip-dot"></div><strong>Kneebar entry:</strong> From top position, reach across and control the knee while rotating your body perpendicular — hyperextends the knee</div><div class="tip-row"><div class="tip-dot"></div><strong>Advanced warning:</strong> Leg locks are powerful and dangerous — drilling the entries solo builds the movement pattern safely</div></div><div class="rep-counter"><div class="rep-label">Rep Counter (Each Side)</div><div class="rep-display" id="legCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('leg',-1)">−</button><button class="rep-btn plus" onclick="changeRep('leg',1)">+</button></div></div></div></div>
  <div class="section"><div class="section-header">🥋 Drill 2 — Berimbolo Entry</div><div class="drill-card" id="beri-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Berimbolo Back Take Entry</div><div class="drill-status" id="beriStatus" onclick="completeDrill('beri')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">6 each side</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>From de la Riva guard:</strong> Hook the ankle with your instep, pull their leg across and invert underneath them — rolling to take the back</div><div class="tip-row"><div class="tip-dot"></div><strong>Inversion is the key:</strong> You roll upside down briefly — this movement takes time to develop but is one of the most effective back takes in modern BJJ</div><div class="tip-row"><div class="tip-dot"></div><strong>This is elite BJJ:</strong> The berimbolo is associated with the Mendes brothers and the highest levels of sport BJJ</div></div><div class="rep-counter"><div class="rep-label">Rep Counter (Each Side)</div><div class="rep-display" id="beriCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('beri',-1)">−</button><button class="rep-btn plus" onclick="changeRep('beri',1)">+</button></div></div></div></div>
  <div class="section"><div class="section-header">🥋 Drill 3 — Advanced Submission Chain</div><div class="drill-card" id="chain-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Arm-Leg Attack Chain</div><div class="drill-status" id="chainStatus" onclick="completeDrill('chain')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">3 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Advanced chain: armbar → triangle → omoplata → back take → rear naked choke setup → heel hook entry — flow between upper and lower body attacks without resetting</div><div class="tip-row"><div class="tip-dot"></div><strong>This is advanced BJJ:</strong> Chaining arm attacks to leg attacks is the mark of a complete submission grappler</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="chainTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('chain',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('chain',180)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 BJJ Advanced Session A Complete!</button>
$omnihtml$),
('bjj_advanced_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥋 BJJ · Advanced · Power Focus</div>
      <div class="header-title">Advanced Session B</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥋 Drill 1 — Explosive Scrambles</div><div class="drill-card" id="scram-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Scramble Sequences</div><div class="drill-status" id="scramStatus" onclick="completeDrill('scram')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Full scramble chain:</strong> Hip escape → granby roll → sit out → stand up → level change → shot → sprawl → hip escape again — continuous loop at competition speed</div><div class="tip-row"><div class="tip-dot"></div><strong>Never stop:</strong> Advanced grapplers win scrambles by being first to the next position — your body has to know where to go before your brain does</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="scramTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('scram',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('scram',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🥋 Drill 2 — Guard Retention Power</div><div class="drill-card" id="ret-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Explosive Guard Retention</div><div class="drill-status" id="retStatus" onclick="completeDrill('ret')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">90 sec each</div><div class="meta-chip">20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Continuous explosive hip movements to maintain guard — shrimping, rolling, inverting, framing — non-stop for 90 seconds simulating someone actively trying to pass</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="retTimer">1:30</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('ret',90)">Start</button><button class="timer-btn reset" onclick="resetTimer('ret',90)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 BJJ Advanced Session B Complete!</button>
$omnihtml$),
('bjj_advanced_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥋 BJJ · Advanced · Conditioning</div>
      <div class="header-title">Advanced Session C</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥋 Drill 1 — Competition Simulation</div><div class="drill-card" id="comp-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">6 x 5-Minute Competition Rounds</div><div class="drill-status" id="compStatus" onclick="completeDrill('comp')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Rounds</div><div class="meta-chip highlight">5 min each</div><div class="meta-chip">90 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>IBJJF adult matches are 5 minutes:</strong> 6 rounds of 5 minutes is a full competition day simulation — this is how elite competitors prepare</div><div class="tip-row"><div class="tip-dot"></div><strong>Position then submission:</strong> Flow through positions looking for openings — advanced BJJ does not force submissions, it earns them</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="compTimer">5:00</div><div class="timer-set-info">Round <span id="compCurrentSet">1</span> of <span>6</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('comp',300)">Start</button><button class="timer-btn reset" onclick="resetTimer('comp',300)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 BJJ Advanced Session C Complete!</button>
$omnihtml$),
('bjj_advanced_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥋 BJJ · Advanced · No Equipment</div>
      <div class="header-title">Advanced Session D</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥋 Drill 1 — Elite Solo Flow</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Advanced BJJ Solo Flow</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Sets</div><div class="meta-chip highlight">5 min each</div><div class="meta-chip">90 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>The complete advanced BJJ solo toolkit — submission chains, leg lock entries, berimbolo movement, scramble sequences, guard retention — all flowing for 5 minutes straight</div><div class="tip-row"><div class="tip-dot"></div><strong>This is black belt preparation:</strong> Solo drilling at this volume and complexity is what separates advanced grapplers from intermediate ones</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">5:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>5</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',300)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',300)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 BJJ Advanced Session D Complete!</button>
$omnihtml$),
('bjj_intermediate_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥋 BJJ · Intermediate · Technique Focus</div>
      <div class="header-title">Intermediate Session A</div>
    </div>
    <div class="level-badge">Technique</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥋 Drill 1 — Closed Guard Movements</div><div class="drill-card" id="guard-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Closed Guard Hip Movements</div><div class="drill-status" id="guardStatus" onclick="completeDrill('guard')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">10 each side</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Hip bump setup:</strong> From guard, shoot your hips up to break posture — this is the entry for the hip bump sweep and kimura</div><div class="tip-row"><div class="tip-dot"></div><strong>Arm drag simulation:</strong> Reach across and pull an imaginary sleeve across your body, cutting the angle for a back take</div><div class="tip-row"><div class="tip-dot"></div><strong>Why it matters:</strong> Closed guard at intermediate level is about controlling posture and creating angles — not just holding on</div></div><div class="rep-counter"><div class="rep-label">Rep Counter (Each Side)</div><div class="rep-display" id="guardCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('guard',-1)">−</button><button class="rep-btn plus" onclick="changeRep('guard',1)">+</button></div></div></div></div>
  <div class="section"><div class="section-header">🥋 Drill 2 — Triangle Setup Flow</div><div class="drill-card" id="triangle-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Triangle Choke Entry Drilling</div><div class="drill-status" id="triangleStatus" onclick="completeDrill('triangle')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">8 each side</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Shoot the hip:</strong> From guard, shoot one hip to the side while pulling the imaginary arm across — this creates the angle for the triangle</div><div class="tip-row"><div class="tip-dot"></div><strong>Lock the figure-4:</strong> Throw the leg over the imaginary shoulder, lock the figure-4 with your legs — shin should cut across the neck</div><div class="tip-row"><div class="tip-dot"></div><strong>Pull the head down:</strong> Final detail — pull the head down while squeezing — this completes the choke</div></div><div class="rep-counter"><div class="rep-label">Rep Counter (Each Side)</div><div class="rep-display" id="triangleCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('triangle',-1)">−</button><button class="rep-btn plus" onclick="changeRep('triangle',1)">+</button></div></div></div></div>
  <div class="section"><div class="section-header">🥋 Drill 3 — Submission Chain Flow</div><div class="drill-card" id="chain-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Armbar → Triangle → Omoplata Chain</div><div class="drill-status" id="chainStatus" onclick="completeDrill('chain')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Flow between submissions: attempt the armbar, when they defend transition to the triangle, when they posture up flow to the omoplata — this is intermediate BJJ guard work</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="chainTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('chain',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('chain',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🥋 Intermediate Session A Complete!</button>
$omnihtml$),
('bjj_intermediate_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥋 BJJ · Intermediate · Power Focus</div>
      <div class="header-title">Intermediate Session B</div>
    </div>
    <div class="level-badge">Power</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥋 Drill 1 — Guard Passing Entries</div><div class="drill-card" id="pass-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Torreando & Knee Slice Pass</div><div class="drill-status" id="passStatus" onclick="completeDrill('pass')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">8 each side</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Torreando:</strong> Push both knees to one side while stepping laterally — follow the knees and establish side control</div><div class="tip-row"><div class="tip-dot"></div><strong>Knee slice:</strong> Drive your knee through the space between their legs, keeping your weight on the near side — a fundamental passing motion</div><div class="tip-row"><div class="tip-dot"></div><strong>Pressure first:</strong> Intermediate passing is about pressure and weight distribution — the technique only works if you are heavy on them</div></div><div class="rep-counter"><div class="rep-label">Rep Counter (Each Side)</div><div class="rep-display" id="passCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('pass',-1)">−</button><button class="rep-btn plus" onclick="changeRep('pass',1)">+</button></div></div></div></div>
  <div class="section"><div class="section-header">🥋 Drill 2 — Back Take Entries</div><div class="drill-card" id="back-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Back Take Entries</div><div class="drill-status" id="backStatus" onclick="completeDrill('back')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">8 each side</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Arm drag to back:</strong> Pull the arm across, step to the outside, get your chest on their back and hook the legs</div><div class="tip-row"><div class="tip-dot"></div><strong>Hooks in:</strong> Your feet hook inside their thighs — both hooks must be in before you have back control</div><div class="tip-row"><div class="tip-dot"></div><strong>Why the back matters:</strong> The rear naked choke from back control is the highest percentage finish in all of BJJ and MMA</div></div><div class="rep-counter"><div class="rep-label">Rep Counter (Each Side)</div><div class="rep-display" id="backCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('back',-1)">−</button><button class="rep-btn plus" onclick="changeRep('back',1)">+</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🥋 Intermediate Session B Complete!</button>
$omnihtml$),
('bjj_intermediate_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥋 BJJ · Intermediate · Conditioning</div>
      <div class="header-title">Intermediate Session C</div>
    </div>
    <div class="level-badge">Cut</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥋 Drill 1 — 5-Minute Flow Rounds</div><div class="drill-card" id="flow-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Extended Grappling Flow Rounds</div><div class="drill-status" id="flowStatus" onclick="completeDrill('flow')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">5 min each</div><div class="meta-chip">90 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>5-minute rounds simulate real BJJ rolling rounds — flow through every position continuously without stopping</div><div class="tip-row"><div class="tip-dot"></div><strong>Position sequence:</strong> Guard work → escape to turtle → sit out → stand up → level change → hip escape → repeat</div><div class="tip-row"><div class="tip-dot"></div>At minute 4 you will feel it. Push through — that is where grappling cardio is built</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="flowTimer">5:00</div><div class="timer-set-info">Round <span id="flowCurrentSet">1</span> of <span>4</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('flow',300)">Start</button><button class="timer-btn reset" onclick="resetTimer('flow',300)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🥋 Drill 2 — Explosive Scramble Bursts</div><div class="drill-card" id="scramble-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Scramble Conditioning</div><div class="drill-status" id="scrambleStatus" onclick="completeDrill('scramble')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">30 sec each</div><div class="meta-chip">15 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Max output scramble — hip escapes, granby rolls, stand-ups, sprawls, sit-outs — every movement as fast as possible for 30 seconds</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="scrambleTimer">0:30</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('scramble',30)">Start</button><button class="timer-btn reset" onclick="resetTimer('scramble',30)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🥋 Intermediate Session C Complete!</button>
$omnihtml$),
('bjj_intermediate_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥋 BJJ · Intermediate · No Equipment</div>
      <div class="header-title">Intermediate Session D</div>
    </div>
    <div class="level-badge">Zero Gear</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥋 Drill 1 — Submission Chain Solo Flow</div><div class="drill-card" id="chain-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Solo Submission Drilling</div><div class="drill-status" id="chainStatus" onclick="completeDrill('chain')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Chain solo: armbar entry → triangle transition → omoplata transition → back take entry — all flowing from one position to the next</div><div class="tip-row"><div class="tip-dot"></div>Zero equipment — this is pure grappling intelligence work that transfers directly to the mats</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="chainTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('chain',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('chain',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🥋 Drill 2 — Positional Conditioning</div><div class="drill-card" id="pos-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Position to Position Flow</div><div class="drill-status" id="posStatus" onclick="completeDrill('pos')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">5 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Move through guard, side control bottom, mount escape, turtle, back defence — transitioning between positions without stopping for 5 minutes straight</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="posTimer">5:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('pos',300)">Start</button><button class="timer-btn reset" onclick="resetTimer('pos',300)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🥋 Intermediate Session D Complete!</button>
$omnihtml$),
('boxing_advanced_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥊 Boxing · Advanced · Technique Focus</div>
      <div class="header-title">Advanced Session A</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥊 Drill 1 — Philly Shell Defense</div><div class="drill-card" id="shell-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Philly Shell Counter System</div><div class="drill-status" id="shellStatus" onclick="completeDrill('shell')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Shell position:</strong> Lead arm rests across the body, rear hand by the chin, lead shoulder rolled forward to deflect jabs</div><div class="tip-row"><div class="tip-dot"></div><strong>Shoulder roll:</strong> Roll the lead shoulder to deflect incoming jabs — not a slip, a roll — then fire the right hand counter</div><div class="tip-row"><div class="tip-dot"></div><strong>Catch and counter:</strong> Use the rear hand to catch hooks, then immediately return with your own hook</div><div class="tip-row"><div class="tip-dot"></div><strong>This is elite boxing:</strong> The Philly shell is used by Floyd Mayweather, James Toney and the best defensive boxers in history</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="shellTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('shell',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('shell',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🥊 Drill 2 — Combination Chains 5+ Punches</div><div class="drill-card" id="chain-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Combination Chains</div><div class="drill-status" id="chainStatus" onclick="completeDrill('chain')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>5+ punch combinations:</strong> 1-2-3-2-3, 1-2-body-3-2, 1-1-2-3-2-body — advanced boxers never stop at 2 or 3 punches</div><div class="tip-row"><div class="tip-dot"></div><strong>Change levels constantly:</strong> Head-body-head combinations keep opponents guessing and open new targets</div><div class="tip-row"><div class="tip-dot"></div><strong>Exit cleanly:</strong> Every combination ends with movement — step off the line after the last punch</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="chainTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('chain',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('chain',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🥊 Drill 3 — Southpaw Switching</div><div class="drill-card" id="south-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Orthodox to Southpaw Switching</div><div class="drill-status" id="southStatus" onclick="completeDrill('south')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Switch mid-combination:</strong> Throw a right hand then switch your stance — your left hand is now your power hand</div><div class="tip-row"><div class="tip-dot"></div><strong>Why it works:</strong> Southpaw angles are uncomfortable for orthodox opponents — switching mid-fight creates confusion and new attack angles</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="southTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('south',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('south',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Boxing Advanced Session A Complete!</button>
$omnihtml$),
('boxing_advanced_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥊 Boxing · Advanced · Power Focus</div>
      <div class="header-title">Advanced Session B</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥊 Drill 1 — One Punch KO Power</div><div class="drill-card" id="ko-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Maximum Knockout Power Training</div><div class="drill-status" id="koStatus" onclick="completeDrill('ko')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Sets</div><div class="meta-chip highlight">5 reps each</div><div class="meta-chip">60 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>One punch at a time:</strong> Load up fully, throw one punch at absolute maximum power, reset completely, repeat</div><div class="tip-row"><div class="tip-dot"></div><strong>Hip torque first:</strong> The punch starts from the hip — maximum hip rotation before the shoulder even moves</div><div class="tip-row"><div class="tip-dot"></div><strong>Fist turns on impact:</strong> Rotate the fist to horizontal at the point of contact — this adds torque and stability on the target</div></div><div class="rep-counter"><div class="rep-label">Rep Counter</div><div class="rep-display" id="koCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('ko',-1)">−</button><button class="rep-btn plus" onclick="changeRep('ko',1)">+</button></div></div></div></div>
  <div class="section"><div class="section-header">🥊 Drill 2 — Explosive Burst Training</div><div class="drill-card" id="burst-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">10-Punch Burst Intervals</div><div class="drill-status" id="burstStatus" onclick="completeDrill('burst')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Sets</div><div class="meta-chip highlight">10 sec burst / 20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>10 seconds of absolute maximum output punches — every single punch at KO power — then full rest. This is how power boxers train explosiveness</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="burstTimer">0:10</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('burst',10)">Start</button><button class="timer-btn reset" onclick="resetTimer('burst',10)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Boxing Advanced Session B Complete!</button>
$omnihtml$),
('boxing_advanced_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥊 Boxing · Advanced · Conditioning</div>
      <div class="header-title">Advanced Session C</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥊 Drill 1 — Championship Rounds</div><div class="drill-card" id="champ-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">8 x 3-Minute Championship Rounds</div><div class="drill-status" id="champStatus" onclick="completeDrill('champ')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">8 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Championship boxing is 12 rounds:</strong> 8 rounds of shadow is serious advanced conditioning — rounds 6-8 are where character is built</div><div class="tip-row"><div class="tip-dot"></div><strong>Never cruise:</strong> Advanced boxers maintain quality technique even when exhausted — that is the entire point of this session</div><div class="tip-row"><div class="tip-dot"></div><strong>Use everything:</strong> Shell, slips, rolls, feints, body-head, southpaw switching — the full advanced arsenal</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="champTimer">3:00</div><div class="timer-set-info">Round <span id="champCurrentSet">1</span> of <span>8</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('champ',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('champ',180)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Boxing Advanced Session C Complete!</button>
$omnihtml$),
('boxing_advanced_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥊 Boxing · Advanced · No Equipment</div>
      <div class="header-title">Advanced Session D</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥊 Drill 1 — Complete Advanced Shadow</div><div class="drill-card" id="adv-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Full Advanced Shadowboxing</div><div class="drill-status" id="advStatus" onclick="completeDrill('adv')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Every advanced technique in one session — Philly shell, southpaw switching, 5+ punch combinations, feints, body-head — all flowing for 6 rounds</div><div class="tip-row"><div class="tip-dot"></div><strong>Round 1-2:</strong> Technical focus — every movement deliberate and precise<br/><strong>Round 3-4:</strong> Build intensity — combinations longer and faster<br/><strong>Round 5-6:</strong> Competition pace — this is your championship round simulation</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="advTimer">3:00</div><div class="timer-set-info">Round <span id="advCurrentSet">1</span> of <span>6</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('adv',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('adv',180)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Boxing Advanced Session D Complete!</button>
$omnihtml$),
('boxing_intermediate_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥊 Boxing · Intermediate · Technique Focus</div>
      <div class="header-title">Intermediate Session A</div>
    </div>
    <div class="level-badge">Technique</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥊 Drill 1 — Slipping Punches</div><div class="drill-card" id="slip-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Slip and Counter</div><div class="drill-status" id="slipStatus" onclick="completeDrill('slip')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Slip outside:</strong> Visualize a jab coming at you — rotate your head slightly outside the punch, staying upright, then fire a counter right hand</div><div class="tip-row"><div class="tip-dot"></div><strong>Slip inside:</strong> Slip to the inside of an imaginary cross, then hook to the body or head</div><div class="tip-row"><div class="tip-dot"></div><strong>Stay compact:</strong> Slips are small movements — you are not ducking, you are rotating at the waist just enough to make the punch miss</div><div class="tip-row"><div class="tip-dot"></div><strong>Counter immediately:</strong> Every slip is followed by a punch — defense without offense teaches nothing</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="slipTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('slip',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('slip',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🥊 Drill 2 — Rolling Under Hooks</div><div class="drill-card" id="roll-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Roll and Counter</div><div class="drill-status" id="rollStatus" onclick="completeDrill('roll')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>U-shape movement:</strong> Bend your knees and roll under imaginary hooks — down on one side, up on the other — like ducking under a bar</div><div class="tip-row"><div class="tip-dot"></div><strong>Counter on the way up:</strong> As you come up from the roll, you are in perfect position to hook to the body or head</div><div class="tip-row"><div class="tip-dot"></div><strong>String them together:</strong> Roll left, roll right, continuously — this is what professional boxers drill for hours</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="rollTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('roll',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('roll',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🥊 Drill 3 — Counter Combination Shadow</div><div class="drill-card" id="counter-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Counter Combination Shadowboxing</div><div class="drill-status" id="counterStatus" onclick="completeDrill('counter')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Always react first — visualize the opponent throwing before you throw. Slip or roll, then counter with 2-3 punch combinations</div><div class="tip-row"><div class="tip-dot"></div>Common counters: slip jab → right hand body → left hook head. Roll hook → right hand → left hook</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="counterTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('counter',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('counter',180)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🥊 Intermediate Session A Complete!</button>
$omnihtml$),
('boxing_intermediate_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥊 Boxing · Intermediate · Power Focus</div>
      <div class="header-title">Intermediate Session B</div>
    </div>
    <div class="level-badge">Power</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥊 Drill 1 — Feint to Power Shot</div><div class="drill-card" id="feint-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Feint Setup Power Combinations</div><div class="drill-status" id="feintStatus" onclick="completeDrill('feint')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">10 reps each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>The feint:</strong> A short shoulder or body movement that looks like a punch but isn't — it forces your opponent to react, opening them up</div><div class="tip-row"><div class="tip-dot"></div><strong>Feint jab → power right hand:</strong> Fake the jab to make them flinch, then drive the real cross through the gap</div><div class="tip-row"><div class="tip-dot"></div><strong>Feint body → power head:</strong> Drop your shoulder toward the body, they lower their guard, then swing upstairs with the hook</div></div><div class="rep-counter"><div class="rep-label">Rep Counter</div><div class="rep-display" id="feintCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('feint',-1)">−</button><button class="rep-btn plus" onclick="changeRep('feint',1)">+</button></div></div></div></div>
  <div class="section"><div class="section-header">🥊 Drill 2 — Body-Head Combinations</div><div class="drill-card" id="bodyhead-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Body-Head Power Combos</div><div class="drill-status" id="bodyheadStatus" onclick="completeDrill('bodyhead')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>1-body-3:</strong> Jab to the head, right hand to the body, left hook back to the head — the classic power combination</div><div class="tip-row"><div class="tip-dot"></div><strong>Dig the body shot:</strong> A real body shot bends your knees and drives through — not a tap, a dig</div><div class="tip-row"><div class="tip-dot"></div><strong>Why it works:</strong> Body punches force the guard down, opening the head for the finishing shot</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="bodyheadTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('bodyhead',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('bodyhead',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🥊 Intermediate Session B Complete!</button>
$omnihtml$),
('boxing_intermediate_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥊 Boxing · Intermediate · Conditioning</div>
      <div class="header-title">Intermediate Session C</div>
    </div>
    <div class="level-badge">Cut</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥊 Drill 1 — 5 Round Shadow</div><div class="drill-card" id="five-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">5 x 3-Minute Shadow Rounds</div><div class="drill-status" id="fiveStatus" onclick="completeDrill('five')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Fight pace every round:</strong> Rounds 1-2 are your warm-up pace. Rounds 3-4 push harder. Round 5 is everything you have left</div><div class="tip-row"><div class="tip-dot"></div><strong>Use everything:</strong> Slips, rolls, feints, body shots, counters — every technique from sessions A and B</div><div class="tip-row"><div class="tip-dot"></div><strong>Never stop moving:</strong> Even between combinations, stay in motion — feet always active</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="fiveTimer">3:00</div><div class="timer-set-info">Round <span id="fiveCurrentSet">1</span> of <span>5</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('five',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('five',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🥊 Drill 2 — Slip Rope Intervals</div><div class="drill-card" id="sliprope-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Continuous Slip and Roll Intervals</div><div class="drill-status" id="slipropStatus" onclick="completeDrill('sliprope')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">45 sec each</div><div class="meta-chip">15 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Non-stop slipping and rolling for 45 seconds — this is what the slip rope drill replicates and it is brutal conditioning</div></div><div class="timer-wrap"><div class="timer-label">Interval Timer</div><div class="timer-display" id="slipropTimer">0:45</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('sliprope',45)">Start</button><button class="timer-btn reset" onclick="resetTimer('sliprope',45)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🥊 Intermediate Session C Complete!</button>
$omnihtml$),
('boxing_intermediate_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🥊 Boxing · Intermediate · No Equipment</div>
      <div class="header-title">Intermediate Session D</div>
    </div>
    <div class="level-badge">Zero Gear</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🥊 Drill 1 — Defense-First Shadowboxing</div><div class="drill-card" id="def-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Move First, Punch Second</div><div class="drill-status" id="defStatus" onclick="completeDrill('def')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Defensive first mindset:</strong> Every round begins with you moving and slipping — you only punch after you have made your opponent miss</div><div class="tip-row"><div class="tip-dot"></div><strong>This builds real boxing IQ:</strong> Most beginners want to punch first. Intermediate boxers learn that making punches miss creates the openings</div><div class="tip-row"><div class="tip-dot"></div>Visualize the opponent attacking — slip, roll, move — then counter with precise short combinations</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="defTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('def',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('def',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🥊 Drill 2 — Footwork Patterns</div><div class="drill-card" id="foot-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Footwork Patterns</div><div class="drill-status" id="footStatus" onclick="completeDrill('foot')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Circle both ways:</strong> Circle left off the jab, circle right off the right hand — make opponents constantly readjust</div><div class="tip-row"><div class="tip-dot"></div><strong>In-and-out:</strong> Step in to punch range, throw a combo, step out before they can counter — controlling distance is controlling the fight</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="footTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('foot',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('foot',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🥊 Intermediate Session D Complete!</button>
$omnihtml$),
('judo_advanced_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">👘 Judo · Advanced · Technique Focus</div>
      <div class="header-title">Advanced Session A</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Technique Mastery</div><div class="drill-card" id="adv-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition-Level Technique Flow</div><div class="drill-status" id="advStatus" onclick="completeDrill('adv')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Advanced level:</strong> Techniques should be automatic — no thinking about what comes next, just flowing movement</div><div class="tip-row"><div class="tip-dot"></div><strong>Setups for everything:</strong> Every technique is preceded by a feint, a level change or a setup movement — advanced fighters never telegraph</div><div class="tip-row"><div class="tip-dot"></div><strong>Competition mindset:</strong> Visualize an opponent who is as good as you — how do you create the opening?</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="advTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('adv',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('adv',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Counter-Attack System</div><div class="drill-card" id="counter-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Counter-Attack Drilling</div><div class="drill-status" id="counterStatus" onclick="completeDrill('counter')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>React to imaginary attacks and counter with your most advanced techniques — advanced training is always reactive, not just initiative-based</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="counterTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('counter',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('counter',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Judo Advanced Session A Complete!</button>
$omnihtml$),
('judo_advanced_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">👘 Judo · Advanced · Power Focus</div>
      <div class="header-title">Advanced Session B</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Power Training</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Maximum Output Power Session</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Sets</div><div class="meta-chip highlight">10 sec max / 20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Absolute maximum output:</strong> 10 seconds of everything you have — every technique at competition power and aggression</div><div class="tip-row"><div class="tip-dot"></div><strong>Full rest between sets:</strong> Power training requires full recovery — 20 seconds is not enough rest, but that is the point</div><div class="tip-row"><div class="tip-dot"></div><strong>This builds competition power:</strong> The ability to generate maximum force under fatigue is what wins fights</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="powerTimer">0:10</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',10)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',10)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Power</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Full Power Combination Rounds</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">60 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>2 minutes of combinations thrown with fight-night power — not cardio pace, not technique pace, power pace — every technique designed to finish</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Judo Advanced Session B Complete!</button>
$omnihtml$),
('judo_advanced_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">👘 Judo · Advanced · Conditioning</div>
      <div class="header-title">Advanced Session C</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Conditioning</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">8 x 3-Minute Elite Rounds</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">8 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>8 rounds at fight pace:</strong> This is the advanced conditioning benchmark — if you can complete this at full intensity you have competition-level cardio</div><div class="tip-row"><div class="tip-dot"></div><strong>Rounds 1-3:</strong> Build pace — technical but intense<br/><strong>Rounds 4-6:</strong> Push harder — combinations longer<br/><strong>Rounds 7-8:</strong> Championship rounds — everything left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">3:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>8</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Anaerobic Finisher</div><div class="drill-card" id="finish-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Finisher</div><div class="drill-status" id="finishStatus" onclick="completeDrill('finish')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata finisher after the main rounds — this is the pain that builds champions. 20 seconds of absolute maximum output, 10 seconds off, 4 rounds.</div></div><div class="timer-wrap"><div class="timer-label">Tabata Timer</div><div class="timer-display" id="finishTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('finish',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('finish',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Judo Advanced Session C Complete!</button>
$omnihtml$),
('judo_advanced_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">👘 Judo · Advanced · No Equipment</div>
      <div class="header-title">Advanced Session D</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Solo Session</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Advanced Solo Flow</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — the complete advanced session using every technique from sessions A, B and C in a continuous flow</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what elite training looks like without a gym:</strong> A complete fighter can train anywhere, anytime, with nothing</div><div class="tip-row"><div class="tip-dot"></div><strong>Mental component:</strong> Visualize competition opponents — specific scenarios, specific counters — not just moving through techniques</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">4:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>6</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Visualization Training</div><div class="drill-card" id="viz-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition Mental Rehearsal</div><div class="drill-status" id="vizStatus" onclick="completeDrill('viz')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">15 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Sit or stand quietly and run through your complete game plan — every technique working, every position controlled, every submission finished — in vivid detail</div><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Jon Jones, GSP, Ronda Rousey — visualization is a documented performance enhancer at the highest levels of combat sports</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="vizTimer">15:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('viz',900)">Start</button><button class="timer-btn reset" onclick="resetTimer('viz',900)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Judo Advanced Session D Complete!</button>
$omnihtml$),
('judo_intermediate_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">👘 Judo · Intermediate · Technique Focus</div>
      <div class="header-title">Intermediate Session A</div>
    </div>
    <div class="level-badge">Technique</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Judo Intermediate Technique</div><div class="drill-card" id="tech-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Technique Combinations</div><div class="drill-status" id="techStatus" onclick="completeDrill('tech')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Intermediate level:</strong> Beginner techniques assumed solid — now we chain them into combinations and add setup movements</div><div class="tip-row"><div class="tip-dot"></div><strong>Feints and setups:</strong> At intermediate level every technique is preceded by a setup — never attack without creating the opening first</div><div class="tip-row"><div class="tip-dot"></div><strong>Flow between techniques:</strong> One technique flows into the next — no stopping between combinations</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="techTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('tech',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('tech',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Advanced Combination Flow</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">3-4 Technique Combination Drilling</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Build longer combinations than beginner level — 3 to 4 technique chains that flow naturally from one movement to the next</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">👘 Intermediate Session A Complete!</button>
$omnihtml$),
('judo_intermediate_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">👘 Judo · Intermediate · Power Focus</div>
      <div class="header-title">Intermediate Session B</div>
    </div>
    <div class="level-badge">Power</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Power Generation</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Power Combinations</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Power from the ground up:</strong> At intermediate level every technique generates power from the feet through the hips — not just the arms or legs</div><div class="tip-row"><div class="tip-dot"></div><strong>Setup before power:</strong> A feint or setup movement precedes every power technique — telegraphing is a beginner habit</div><div class="tip-row"><div class="tip-dot"></div><strong>Explosive bursts:</strong> 3-second max output bursts followed by movement — this mirrors real fighting energy output</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="powerTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Bursts</div><div class="drill-card" id="burst-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Combination Bursts</div><div class="drill-status" id="burstStatus" onclick="completeDrill('burst')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">30 sec burst</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>30 seconds of maximum output — every technique at competition power and speed — then full rest</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="burstTimer">0:30</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('burst',30)">Start</button><button class="timer-btn reset" onclick="resetTimer('burst',30)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">👘 Intermediate Session B Complete!</button>
$omnihtml$),
('judo_intermediate_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">👘 Judo · Intermediate · Conditioning</div>
      <div class="header-title">Intermediate Session C</div>
    </div>
    <div class="level-badge">Cut</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">5-Round Conditioning</div><div class="drill-card" id="five-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">5 x 3-Minute Competition Rounds</div><div class="drill-status" id="fiveStatus" onclick="completeDrill('five')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Competition simulation:</strong> 5 rounds of 3 minutes mirrors real competition format — every round at fight pace</div><div class="tip-row"><div class="tip-dot"></div><strong>Escalate through the rounds:</strong> Rounds 1-2 build, rounds 3-4 push, round 5 is everything you have left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="fiveTimer">3:00</div><div class="timer-set-info">Round <span id="fiveCurrentSet">1</span> of <span>5</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('five',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('five',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">High Intensity Intervals</div><div class="drill-card" id="hiit-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">HIIT Technique Bursts</div><div class="drill-status" id="hiitStatus" onclick="completeDrill('hiit')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata-style technique bursts — 20 seconds of max output, 10 seconds off, 6 rounds. This builds the anaerobic capacity for competition</div></div><div class="timer-wrap"><div class="timer-label">Interval Timer</div><div class="timer-display" id="hiitTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('hiit',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('hiit',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">👘 Intermediate Session C Complete!</button>
$omnihtml$),
('judo_intermediate_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">👘 Judo · Intermediate · No Equipment</div>
      <div class="header-title">Intermediate Session D</div>
    </div>
    <div class="level-badge">Zero Gear</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Solo Flow</div><div class="drill-card" id="flow-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Intermediate Flow Session</div><div class="drill-status" id="flowStatus" onclick="completeDrill('flow')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — full intermediate technique flow for 4 minutes per round. Every technique from sessions A and B, chained together without stopping</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what intermediate training looks like:</strong> Fluent technique that does not require thought — just movement</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="flowTimer">4:00</div><div class="timer-set-info">Round <span id="flowCurrentSet">1</span> of <span>4</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('flow',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('flow',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Mental Game</div><div class="drill-card" id="mental-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Visualization and Mental Rehearsal</div><div class="drill-status" id="mentalStatus" onclick="completeDrill('mental')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">10 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Sit or stand quietly and visualize your techniques working against a resisting opponent — see the movement, feel it, hear it</div><div class="tip-row"><div class="tip-dot"></div>Studies show mental rehearsal activates the same neural pathways as physical practice — this is not a substitute for drilling but it is a genuine supplement</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="mentalTimer">10:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('mental',600)">Start</button><button class="timer-btn reset" onclick="resetTimer('mental',600)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">👘 Intermediate Session D Complete!</button>
$omnihtml$),
('karate_advanced_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦶 Karate · Advanced · Technique Focus</div>
      <div class="header-title">Advanced Session A</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Technique Mastery</div><div class="drill-card" id="adv-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition-Level Technique Flow</div><div class="drill-status" id="advStatus" onclick="completeDrill('adv')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Advanced level:</strong> Techniques should be automatic — no thinking about what comes next, just flowing movement</div><div class="tip-row"><div class="tip-dot"></div><strong>Setups for everything:</strong> Every technique is preceded by a feint, a level change or a setup movement — advanced fighters never telegraph</div><div class="tip-row"><div class="tip-dot"></div><strong>Competition mindset:</strong> Visualize an opponent who is as good as you — how do you create the opening?</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="advTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('adv',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('adv',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Counter-Attack System</div><div class="drill-card" id="counter-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Counter-Attack Drilling</div><div class="drill-status" id="counterStatus" onclick="completeDrill('counter')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>React to imaginary attacks and counter with your most advanced techniques — advanced training is always reactive, not just initiative-based</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="counterTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('counter',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('counter',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Karate Advanced Session A Complete!</button>
$omnihtml$),
('karate_advanced_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦶 Karate · Advanced · Power Focus</div>
      <div class="header-title">Advanced Session B</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Power Training</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Maximum Output Power Session</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Sets</div><div class="meta-chip highlight">10 sec max / 20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Absolute maximum output:</strong> 10 seconds of everything you have — every technique at competition power and aggression</div><div class="tip-row"><div class="tip-dot"></div><strong>Full rest between sets:</strong> Power training requires full recovery — 20 seconds is not enough rest, but that is the point</div><div class="tip-row"><div class="tip-dot"></div><strong>This builds competition power:</strong> The ability to generate maximum force under fatigue is what wins fights</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="powerTimer">0:10</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',10)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',10)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Power</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Full Power Combination Rounds</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">60 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>2 minutes of combinations thrown with fight-night power — not cardio pace, not technique pace, power pace — every technique designed to finish</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Karate Advanced Session B Complete!</button>
$omnihtml$),
('karate_advanced_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦶 Karate · Advanced · Conditioning</div>
      <div class="header-title">Advanced Session C</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Conditioning</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">8 x 3-Minute Elite Rounds</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">8 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>8 rounds at fight pace:</strong> This is the advanced conditioning benchmark — if you can complete this at full intensity you have competition-level cardio</div><div class="tip-row"><div class="tip-dot"></div><strong>Rounds 1-3:</strong> Build pace — technical but intense<br/><strong>Rounds 4-6:</strong> Push harder — combinations longer<br/><strong>Rounds 7-8:</strong> Championship rounds — everything left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">3:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>8</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Anaerobic Finisher</div><div class="drill-card" id="finish-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Finisher</div><div class="drill-status" id="finishStatus" onclick="completeDrill('finish')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata finisher after the main rounds — this is the pain that builds champions. 20 seconds of absolute maximum output, 10 seconds off, 4 rounds.</div></div><div class="timer-wrap"><div class="timer-label">Tabata Timer</div><div class="timer-display" id="finishTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('finish',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('finish',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Karate Advanced Session C Complete!</button>
$omnihtml$),
('karate_advanced_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦶 Karate · Advanced · No Equipment</div>
      <div class="header-title">Advanced Session D</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Solo Session</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Advanced Solo Flow</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — the complete advanced session using every technique from sessions A, B and C in a continuous flow</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what elite training looks like without a gym:</strong> A complete fighter can train anywhere, anytime, with nothing</div><div class="tip-row"><div class="tip-dot"></div><strong>Mental component:</strong> Visualize competition opponents — specific scenarios, specific counters — not just moving through techniques</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">4:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>6</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Visualization Training</div><div class="drill-card" id="viz-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition Mental Rehearsal</div><div class="drill-status" id="vizStatus" onclick="completeDrill('viz')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">15 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Sit or stand quietly and run through your complete game plan — every technique working, every position controlled, every submission finished — in vivid detail</div><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Jon Jones, GSP, Ronda Rousey — visualization is a documented performance enhancer at the highest levels of combat sports</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="vizTimer">15:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('viz',900)">Start</button><button class="timer-btn reset" onclick="resetTimer('viz',900)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Karate Advanced Session D Complete!</button>
$omnihtml$),
('karate_intermediate_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦶 Karate · Intermediate · Technique Focus</div>
      <div class="header-title">Intermediate Session A</div>
    </div>
    <div class="level-badge">Technique</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Karate Intermediate Technique</div><div class="drill-card" id="tech-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Technique Combinations</div><div class="drill-status" id="techStatus" onclick="completeDrill('tech')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Intermediate level:</strong> Beginner techniques assumed solid — now we chain them into combinations and add setup movements</div><div class="tip-row"><div class="tip-dot"></div><strong>Feints and setups:</strong> At intermediate level every technique is preceded by a setup — never attack without creating the opening first</div><div class="tip-row"><div class="tip-dot"></div><strong>Flow between techniques:</strong> One technique flows into the next — no stopping between combinations</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="techTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('tech',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('tech',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Advanced Combination Flow</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">3-4 Technique Combination Drilling</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Build longer combinations than beginner level — 3 to 4 technique chains that flow naturally from one movement to the next</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦶 Intermediate Session A Complete!</button>
$omnihtml$),
('karate_intermediate_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦶 Karate · Intermediate · Power Focus</div>
      <div class="header-title">Intermediate Session B</div>
    </div>
    <div class="level-badge">Power</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Power Generation</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Power Combinations</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Power from the ground up:</strong> At intermediate level every technique generates power from the feet through the hips — not just the arms or legs</div><div class="tip-row"><div class="tip-dot"></div><strong>Setup before power:</strong> A feint or setup movement precedes every power technique — telegraphing is a beginner habit</div><div class="tip-row"><div class="tip-dot"></div><strong>Explosive bursts:</strong> 3-second max output bursts followed by movement — this mirrors real fighting energy output</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="powerTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Bursts</div><div class="drill-card" id="burst-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Combination Bursts</div><div class="drill-status" id="burstStatus" onclick="completeDrill('burst')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">30 sec burst</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>30 seconds of maximum output — every technique at competition power and speed — then full rest</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="burstTimer">0:30</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('burst',30)">Start</button><button class="timer-btn reset" onclick="resetTimer('burst',30)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦶 Intermediate Session B Complete!</button>
$omnihtml$),
('karate_intermediate_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦶 Karate · Intermediate · Conditioning</div>
      <div class="header-title">Intermediate Session C</div>
    </div>
    <div class="level-badge">Cut</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">5-Round Conditioning</div><div class="drill-card" id="five-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">5 x 3-Minute Competition Rounds</div><div class="drill-status" id="fiveStatus" onclick="completeDrill('five')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Competition simulation:</strong> 5 rounds of 3 minutes mirrors real competition format — every round at fight pace</div><div class="tip-row"><div class="tip-dot"></div><strong>Escalate through the rounds:</strong> Rounds 1-2 build, rounds 3-4 push, round 5 is everything you have left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="fiveTimer">3:00</div><div class="timer-set-info">Round <span id="fiveCurrentSet">1</span> of <span>5</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('five',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('five',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">High Intensity Intervals</div><div class="drill-card" id="hiit-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">HIIT Technique Bursts</div><div class="drill-status" id="hiitStatus" onclick="completeDrill('hiit')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata-style technique bursts — 20 seconds of max output, 10 seconds off, 6 rounds. This builds the anaerobic capacity for competition</div></div><div class="timer-wrap"><div class="timer-label">Interval Timer</div><div class="timer-display" id="hiitTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('hiit',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('hiit',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦶 Intermediate Session C Complete!</button>
$omnihtml$),
('karate_intermediate_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦶 Karate · Intermediate · No Equipment</div>
      <div class="header-title">Intermediate Session D</div>
    </div>
    <div class="level-badge">Zero Gear</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Solo Flow</div><div class="drill-card" id="flow-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Intermediate Flow Session</div><div class="drill-status" id="flowStatus" onclick="completeDrill('flow')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — full intermediate technique flow for 4 minutes per round. Every technique from sessions A and B, chained together without stopping</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what intermediate training looks like:</strong> Fluent technique that does not require thought — just movement</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="flowTimer">4:00</div><div class="timer-set-info">Round <span id="flowCurrentSet">1</span> of <span>4</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('flow',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('flow',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Mental Game</div><div class="drill-card" id="mental-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Visualization and Mental Rehearsal</div><div class="drill-status" id="mentalStatus" onclick="completeDrill('mental')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">10 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Sit or stand quietly and visualize your techniques working against a resisting opponent — see the movement, feel it, hear it</div><div class="tip-row"><div class="tip-dot"></div>Studies show mental rehearsal activates the same neural pathways as physical practice — this is not a substitute for drilling but it is a genuine supplement</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="mentalTimer">10:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('mental',600)">Start</button><button class="timer-btn reset" onclick="resetTimer('mental',600)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦶 Intermediate Session D Complete!</button>
$omnihtml$),
('krav_maga_advanced_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🛡️ Krav Maga · Advanced · Technique Focus</div>
      <div class="header-title">Advanced Session A</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Technique Mastery</div><div class="drill-card" id="adv-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition-Level Technique Flow</div><div class="drill-status" id="advStatus" onclick="completeDrill('adv')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Advanced level:</strong> Techniques should be automatic — no thinking about what comes next, just flowing movement</div><div class="tip-row"><div class="tip-dot"></div><strong>Setups for everything:</strong> Every technique is preceded by a feint, a level change or a setup movement — advanced fighters never telegraph</div><div class="tip-row"><div class="tip-dot"></div><strong>Competition mindset:</strong> Visualize an opponent who is as good as you — how do you create the opening?</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="advTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('adv',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('adv',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Counter-Attack System</div><div class="drill-card" id="counter-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Counter-Attack Drilling</div><div class="drill-status" id="counterStatus" onclick="completeDrill('counter')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>React to imaginary attacks and counter with your most advanced techniques — advanced training is always reactive, not just initiative-based</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="counterTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('counter',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('counter',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Krav Maga Advanced Session A Complete!</button>
$omnihtml$),
('krav_maga_advanced_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🛡️ Krav Maga · Advanced · Power Focus</div>
      <div class="header-title">Advanced Session B</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Power Training</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Maximum Output Power Session</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Sets</div><div class="meta-chip highlight">10 sec max / 20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Absolute maximum output:</strong> 10 seconds of everything you have — every technique at competition power and aggression</div><div class="tip-row"><div class="tip-dot"></div><strong>Full rest between sets:</strong> Power training requires full recovery — 20 seconds is not enough rest, but that is the point</div><div class="tip-row"><div class="tip-dot"></div><strong>This builds competition power:</strong> The ability to generate maximum force under fatigue is what wins fights</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="powerTimer">0:10</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',10)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',10)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Power</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Full Power Combination Rounds</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">60 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>2 minutes of combinations thrown with fight-night power — not cardio pace, not technique pace, power pace — every technique designed to finish</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Krav Maga Advanced Session B Complete!</button>
$omnihtml$),
('krav_maga_advanced_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🛡️ Krav Maga · Advanced · Conditioning</div>
      <div class="header-title">Advanced Session C</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Conditioning</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">8 x 3-Minute Elite Rounds</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">8 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>8 rounds at fight pace:</strong> This is the advanced conditioning benchmark — if you can complete this at full intensity you have competition-level cardio</div><div class="tip-row"><div class="tip-dot"></div><strong>Rounds 1-3:</strong> Build pace — technical but intense<br/><strong>Rounds 4-6:</strong> Push harder — combinations longer<br/><strong>Rounds 7-8:</strong> Championship rounds — everything left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">3:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>8</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Anaerobic Finisher</div><div class="drill-card" id="finish-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Finisher</div><div class="drill-status" id="finishStatus" onclick="completeDrill('finish')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata finisher after the main rounds — this is the pain that builds champions. 20 seconds of absolute maximum output, 10 seconds off, 4 rounds.</div></div><div class="timer-wrap"><div class="timer-label">Tabata Timer</div><div class="timer-display" id="finishTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('finish',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('finish',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Krav Maga Advanced Session C Complete!</button>
$omnihtml$),
('krav_maga_advanced_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🛡️ Krav Maga · Advanced · No Equipment</div>
      <div class="header-title">Advanced Session D</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Solo Session</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Advanced Solo Flow</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — the complete advanced session using every technique from sessions A, B and C in a continuous flow</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what elite training looks like without a gym:</strong> A complete fighter can train anywhere, anytime, with nothing</div><div class="tip-row"><div class="tip-dot"></div><strong>Mental component:</strong> Visualize competition opponents — specific scenarios, specific counters — not just moving through techniques</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">4:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>6</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Visualization Training</div><div class="drill-card" id="viz-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition Mental Rehearsal</div><div class="drill-status" id="vizStatus" onclick="completeDrill('viz')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">15 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Sit or stand quietly and run through your complete game plan — every technique working, every position controlled, every submission finished — in vivid detail</div><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Jon Jones, GSP, Ronda Rousey — visualization is a documented performance enhancer at the highest levels of combat sports</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="vizTimer">15:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('viz',900)">Start</button><button class="timer-btn reset" onclick="resetTimer('viz',900)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Krav Maga Advanced Session D Complete!</button>
$omnihtml$),
('krav_maga_intermediate_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🛡️ Krav Maga · Intermediate · Technique Focus</div>
      <div class="header-title">Intermediate Session A</div>
    </div>
    <div class="level-badge">Technique</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Krav Maga Intermediate Technique</div><div class="drill-card" id="tech-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Technique Combinations</div><div class="drill-status" id="techStatus" onclick="completeDrill('tech')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Intermediate level:</strong> Beginner techniques assumed solid — now we chain them into combinations and add setup movements</div><div class="tip-row"><div class="tip-dot"></div><strong>Feints and setups:</strong> At intermediate level every technique is preceded by a setup — never attack without creating the opening first</div><div class="tip-row"><div class="tip-dot"></div><strong>Flow between techniques:</strong> One technique flows into the next — no stopping between combinations</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="techTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('tech',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('tech',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Advanced Combination Flow</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">3-4 Technique Combination Drilling</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Build longer combinations than beginner level — 3 to 4 technique chains that flow naturally from one movement to the next</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🛡️ Intermediate Session A Complete!</button>
$omnihtml$),
('krav_maga_intermediate_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🛡️ Krav Maga · Intermediate · Power Focus</div>
      <div class="header-title">Intermediate Session B</div>
    </div>
    <div class="level-badge">Power</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Power Generation</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Power Combinations</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Power from the ground up:</strong> At intermediate level every technique generates power from the feet through the hips — not just the arms or legs</div><div class="tip-row"><div class="tip-dot"></div><strong>Setup before power:</strong> A feint or setup movement precedes every power technique — telegraphing is a beginner habit</div><div class="tip-row"><div class="tip-dot"></div><strong>Explosive bursts:</strong> 3-second max output bursts followed by movement — this mirrors real fighting energy output</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="powerTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Bursts</div><div class="drill-card" id="burst-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Combination Bursts</div><div class="drill-status" id="burstStatus" onclick="completeDrill('burst')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">30 sec burst</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>30 seconds of maximum output — every technique at competition power and speed — then full rest</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="burstTimer">0:30</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('burst',30)">Start</button><button class="timer-btn reset" onclick="resetTimer('burst',30)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🛡️ Intermediate Session B Complete!</button>
$omnihtml$),
('krav_maga_intermediate_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🛡️ Krav Maga · Intermediate · Conditioning</div>
      <div class="header-title">Intermediate Session C</div>
    </div>
    <div class="level-badge">Cut</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">5-Round Conditioning</div><div class="drill-card" id="five-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">5 x 3-Minute Competition Rounds</div><div class="drill-status" id="fiveStatus" onclick="completeDrill('five')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Competition simulation:</strong> 5 rounds of 3 minutes mirrors real competition format — every round at fight pace</div><div class="tip-row"><div class="tip-dot"></div><strong>Escalate through the rounds:</strong> Rounds 1-2 build, rounds 3-4 push, round 5 is everything you have left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="fiveTimer">3:00</div><div class="timer-set-info">Round <span id="fiveCurrentSet">1</span> of <span>5</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('five',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('five',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">High Intensity Intervals</div><div class="drill-card" id="hiit-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">HIIT Technique Bursts</div><div class="drill-status" id="hiitStatus" onclick="completeDrill('hiit')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata-style technique bursts — 20 seconds of max output, 10 seconds off, 6 rounds. This builds the anaerobic capacity for competition</div></div><div class="timer-wrap"><div class="timer-label">Interval Timer</div><div class="timer-display" id="hiitTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('hiit',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('hiit',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🛡️ Intermediate Session C Complete!</button>
$omnihtml$),
('krav_maga_intermediate_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🛡️ Krav Maga · Intermediate · No Equipment</div>
      <div class="header-title">Intermediate Session D</div>
    </div>
    <div class="level-badge">Zero Gear</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Solo Flow</div><div class="drill-card" id="flow-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Intermediate Flow Session</div><div class="drill-status" id="flowStatus" onclick="completeDrill('flow')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — full intermediate technique flow for 4 minutes per round. Every technique from sessions A and B, chained together without stopping</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what intermediate training looks like:</strong> Fluent technique that does not require thought — just movement</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="flowTimer">4:00</div><div class="timer-set-info">Round <span id="flowCurrentSet">1</span> of <span>4</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('flow',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('flow',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Mental Game</div><div class="drill-card" id="mental-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Visualization and Mental Rehearsal</div><div class="drill-status" id="mentalStatus" onclick="completeDrill('mental')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">10 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Sit or stand quietly and visualize your techniques working against a resisting opponent — see the movement, feel it, hear it</div><div class="tip-row"><div class="tip-dot"></div>Studies show mental rehearsal activates the same neural pathways as physical practice — this is not a substitute for drilling but it is a genuine supplement</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="mentalTimer">10:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('mental',600)">Start</button><button class="timer-btn reset" onclick="resetTimer('mental',600)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🛡️ Intermediate Session D Complete!</button>
$omnihtml$),
('kung_fu_advanced_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🐉 Kung Fu · Advanced · Technique Focus</div>
      <div class="header-title">Advanced Session A</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Technique Mastery</div><div class="drill-card" id="adv-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition-Level Technique Flow</div><div class="drill-status" id="advStatus" onclick="completeDrill('adv')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Advanced level:</strong> Techniques should be automatic — no thinking about what comes next, just flowing movement</div><div class="tip-row"><div class="tip-dot"></div><strong>Setups for everything:</strong> Every technique is preceded by a feint, a level change or a setup movement — advanced fighters never telegraph</div><div class="tip-row"><div class="tip-dot"></div><strong>Competition mindset:</strong> Visualize an opponent who is as good as you — how do you create the opening?</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="advTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('adv',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('adv',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Counter-Attack System</div><div class="drill-card" id="counter-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Counter-Attack Drilling</div><div class="drill-status" id="counterStatus" onclick="completeDrill('counter')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>React to imaginary attacks and counter with your most advanced techniques — advanced training is always reactive, not just initiative-based</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="counterTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('counter',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('counter',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Kung Fu Advanced Session A Complete!</button>
$omnihtml$),
('kung_fu_advanced_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🐉 Kung Fu · Advanced · Power Focus</div>
      <div class="header-title">Advanced Session B</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Power Training</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Maximum Output Power Session</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Sets</div><div class="meta-chip highlight">10 sec max / 20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Absolute maximum output:</strong> 10 seconds of everything you have — every technique at competition power and aggression</div><div class="tip-row"><div class="tip-dot"></div><strong>Full rest between sets:</strong> Power training requires full recovery — 20 seconds is not enough rest, but that is the point</div><div class="tip-row"><div class="tip-dot"></div><strong>This builds competition power:</strong> The ability to generate maximum force under fatigue is what wins fights</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="powerTimer">0:10</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',10)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',10)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Power</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Full Power Combination Rounds</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">60 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>2 minutes of combinations thrown with fight-night power — not cardio pace, not technique pace, power pace — every technique designed to finish</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Kung Fu Advanced Session B Complete!</button>
$omnihtml$),
('kung_fu_advanced_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🐉 Kung Fu · Advanced · Conditioning</div>
      <div class="header-title">Advanced Session C</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Conditioning</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">8 x 3-Minute Elite Rounds</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">8 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>8 rounds at fight pace:</strong> This is the advanced conditioning benchmark — if you can complete this at full intensity you have competition-level cardio</div><div class="tip-row"><div class="tip-dot"></div><strong>Rounds 1-3:</strong> Build pace — technical but intense<br/><strong>Rounds 4-6:</strong> Push harder — combinations longer<br/><strong>Rounds 7-8:</strong> Championship rounds — everything left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">3:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>8</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Anaerobic Finisher</div><div class="drill-card" id="finish-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Finisher</div><div class="drill-status" id="finishStatus" onclick="completeDrill('finish')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata finisher after the main rounds — this is the pain that builds champions. 20 seconds of absolute maximum output, 10 seconds off, 4 rounds.</div></div><div class="timer-wrap"><div class="timer-label">Tabata Timer</div><div class="timer-display" id="finishTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('finish',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('finish',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Kung Fu Advanced Session C Complete!</button>
$omnihtml$),
('kung_fu_advanced_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🐉 Kung Fu · Advanced · No Equipment</div>
      <div class="header-title">Advanced Session D</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Solo Session</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Advanced Solo Flow</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — the complete advanced session using every technique from sessions A, B and C in a continuous flow</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what elite training looks like without a gym:</strong> A complete fighter can train anywhere, anytime, with nothing</div><div class="tip-row"><div class="tip-dot"></div><strong>Mental component:</strong> Visualize competition opponents — specific scenarios, specific counters — not just moving through techniques</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">4:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>6</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Visualization Training</div><div class="drill-card" id="viz-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition Mental Rehearsal</div><div class="drill-status" id="vizStatus" onclick="completeDrill('viz')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">15 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Sit or stand quietly and run through your complete game plan — every technique working, every position controlled, every submission finished — in vivid detail</div><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Jon Jones, GSP, Ronda Rousey — visualization is a documented performance enhancer at the highest levels of combat sports</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="vizTimer">15:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('viz',900)">Start</button><button class="timer-btn reset" onclick="resetTimer('viz',900)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Kung Fu Advanced Session D Complete!</button>
$omnihtml$),
('kung_fu_intermediate_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🐉 Kung Fu · Intermediate · Technique Focus</div>
      <div class="header-title">Intermediate Session A</div>
    </div>
    <div class="level-badge">Technique</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Kung Fu Intermediate Technique</div><div class="drill-card" id="tech-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Technique Combinations</div><div class="drill-status" id="techStatus" onclick="completeDrill('tech')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Intermediate level:</strong> Beginner techniques assumed solid — now we chain them into combinations and add setup movements</div><div class="tip-row"><div class="tip-dot"></div><strong>Feints and setups:</strong> At intermediate level every technique is preceded by a setup — never attack without creating the opening first</div><div class="tip-row"><div class="tip-dot"></div><strong>Flow between techniques:</strong> One technique flows into the next — no stopping between combinations</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="techTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('tech',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('tech',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Advanced Combination Flow</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">3-4 Technique Combination Drilling</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Build longer combinations than beginner level — 3 to 4 technique chains that flow naturally from one movement to the next</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🐉 Intermediate Session A Complete!</button>
$omnihtml$),
('kung_fu_intermediate_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🐉 Kung Fu · Intermediate · Power Focus</div>
      <div class="header-title">Intermediate Session B</div>
    </div>
    <div class="level-badge">Power</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Power Generation</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Power Combinations</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Power from the ground up:</strong> At intermediate level every technique generates power from the feet through the hips — not just the arms or legs</div><div class="tip-row"><div class="tip-dot"></div><strong>Setup before power:</strong> A feint or setup movement precedes every power technique — telegraphing is a beginner habit</div><div class="tip-row"><div class="tip-dot"></div><strong>Explosive bursts:</strong> 3-second max output bursts followed by movement — this mirrors real fighting energy output</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="powerTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Bursts</div><div class="drill-card" id="burst-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Combination Bursts</div><div class="drill-status" id="burstStatus" onclick="completeDrill('burst')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">30 sec burst</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>30 seconds of maximum output — every technique at competition power and speed — then full rest</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="burstTimer">0:30</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('burst',30)">Start</button><button class="timer-btn reset" onclick="resetTimer('burst',30)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🐉 Intermediate Session B Complete!</button>
$omnihtml$),
('kung_fu_intermediate_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🐉 Kung Fu · Intermediate · Conditioning</div>
      <div class="header-title">Intermediate Session C</div>
    </div>
    <div class="level-badge">Cut</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">5-Round Conditioning</div><div class="drill-card" id="five-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">5 x 3-Minute Competition Rounds</div><div class="drill-status" id="fiveStatus" onclick="completeDrill('five')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Competition simulation:</strong> 5 rounds of 3 minutes mirrors real competition format — every round at fight pace</div><div class="tip-row"><div class="tip-dot"></div><strong>Escalate through the rounds:</strong> Rounds 1-2 build, rounds 3-4 push, round 5 is everything you have left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="fiveTimer">3:00</div><div class="timer-set-info">Round <span id="fiveCurrentSet">1</span> of <span>5</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('five',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('five',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">High Intensity Intervals</div><div class="drill-card" id="hiit-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">HIIT Technique Bursts</div><div class="drill-status" id="hiitStatus" onclick="completeDrill('hiit')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata-style technique bursts — 20 seconds of max output, 10 seconds off, 6 rounds. This builds the anaerobic capacity for competition</div></div><div class="timer-wrap"><div class="timer-label">Interval Timer</div><div class="timer-display" id="hiitTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('hiit',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('hiit',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🐉 Intermediate Session C Complete!</button>
$omnihtml$),
('kung_fu_intermediate_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🐉 Kung Fu · Intermediate · No Equipment</div>
      <div class="header-title">Intermediate Session D</div>
    </div>
    <div class="level-badge">Zero Gear</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Solo Flow</div><div class="drill-card" id="flow-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Intermediate Flow Session</div><div class="drill-status" id="flowStatus" onclick="completeDrill('flow')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — full intermediate technique flow for 4 minutes per round. Every technique from sessions A and B, chained together without stopping</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what intermediate training looks like:</strong> Fluent technique that does not require thought — just movement</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="flowTimer">4:00</div><div class="timer-set-info">Round <span id="flowCurrentSet">1</span> of <span>4</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('flow',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('flow',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Mental Game</div><div class="drill-card" id="mental-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Visualization and Mental Rehearsal</div><div class="drill-status" id="mentalStatus" onclick="completeDrill('mental')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">10 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Sit or stand quietly and visualize your techniques working against a resisting opponent — see the movement, feel it, hear it</div><div class="tip-row"><div class="tip-dot"></div>Studies show mental rehearsal activates the same neural pathways as physical practice — this is not a substitute for drilling but it is a genuine supplement</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="mentalTimer">10:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('mental',600)">Start</button><button class="timer-btn reset" onclick="resetTimer('mental',600)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🐉 Intermediate Session D Complete!</button>
$omnihtml$),
('mma_advanced_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">⚡ MMA · Advanced · Technique Focus</div>
      <div class="header-title">Advanced Session A</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Technique Mastery</div><div class="drill-card" id="adv-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition-Level Technique Flow</div><div class="drill-status" id="advStatus" onclick="completeDrill('adv')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Advanced level:</strong> Techniques should be automatic — no thinking about what comes next, just flowing movement</div><div class="tip-row"><div class="tip-dot"></div><strong>Setups for everything:</strong> Every technique is preceded by a feint, a level change or a setup movement — advanced fighters never telegraph</div><div class="tip-row"><div class="tip-dot"></div><strong>Competition mindset:</strong> Visualize an opponent who is as good as you — how do you create the opening?</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="advTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('adv',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('adv',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Counter-Attack System</div><div class="drill-card" id="counter-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Counter-Attack Drilling</div><div class="drill-status" id="counterStatus" onclick="completeDrill('counter')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>React to imaginary attacks and counter with your most advanced techniques — advanced training is always reactive, not just initiative-based</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="counterTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('counter',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('counter',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 MMA Advanced Session A Complete!</button>
$omnihtml$),
('mma_advanced_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">⚡ MMA · Advanced · Power Focus</div>
      <div class="header-title">Advanced Session B</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Power Training</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Maximum Output Power Session</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Sets</div><div class="meta-chip highlight">10 sec max / 20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Absolute maximum output:</strong> 10 seconds of everything you have — every technique at competition power and aggression</div><div class="tip-row"><div class="tip-dot"></div><strong>Full rest between sets:</strong> Power training requires full recovery — 20 seconds is not enough rest, but that is the point</div><div class="tip-row"><div class="tip-dot"></div><strong>This builds competition power:</strong> The ability to generate maximum force under fatigue is what wins fights</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="powerTimer">0:10</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',10)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',10)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Power</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Full Power Combination Rounds</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">60 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>2 minutes of combinations thrown with fight-night power — not cardio pace, not technique pace, power pace — every technique designed to finish</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 MMA Advanced Session B Complete!</button>
$omnihtml$),
('mma_advanced_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">⚡ MMA · Advanced · Conditioning</div>
      <div class="header-title">Advanced Session C</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Conditioning</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">8 x 3-Minute Elite Rounds</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">8 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>8 rounds at fight pace:</strong> This is the advanced conditioning benchmark — if you can complete this at full intensity you have competition-level cardio</div><div class="tip-row"><div class="tip-dot"></div><strong>Rounds 1-3:</strong> Build pace — technical but intense<br/><strong>Rounds 4-6:</strong> Push harder — combinations longer<br/><strong>Rounds 7-8:</strong> Championship rounds — everything left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">3:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>8</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Anaerobic Finisher</div><div class="drill-card" id="finish-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Finisher</div><div class="drill-status" id="finishStatus" onclick="completeDrill('finish')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata finisher after the main rounds — this is the pain that builds champions. 20 seconds of absolute maximum output, 10 seconds off, 4 rounds.</div></div><div class="timer-wrap"><div class="timer-label">Tabata Timer</div><div class="timer-display" id="finishTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('finish',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('finish',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 MMA Advanced Session C Complete!</button>
$omnihtml$),
('mma_advanced_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">⚡ MMA · Advanced · No Equipment</div>
      <div class="header-title">Advanced Session D</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Solo Session</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Advanced Solo Flow</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — the complete advanced session using every technique from sessions A, B and C in a continuous flow</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what elite training looks like without a gym:</strong> A complete fighter can train anywhere, anytime, with nothing</div><div class="tip-row"><div class="tip-dot"></div><strong>Mental component:</strong> Visualize competition opponents — specific scenarios, specific counters — not just moving through techniques</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">4:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>6</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Visualization Training</div><div class="drill-card" id="viz-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition Mental Rehearsal</div><div class="drill-status" id="vizStatus" onclick="completeDrill('viz')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">15 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Sit or stand quietly and run through your complete game plan — every technique working, every position controlled, every submission finished — in vivid detail</div><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Jon Jones, GSP, Ronda Rousey — visualization is a documented performance enhancer at the highest levels of combat sports</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="vizTimer">15:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('viz',900)">Start</button><button class="timer-btn reset" onclick="resetTimer('viz',900)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 MMA Advanced Session D Complete!</button>
$omnihtml$),
('mma_intermediate_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">⚡ MMA · Intermediate · Technique Focus</div>
      <div class="header-title">Intermediate Session A</div>
    </div>
    <div class="level-badge">Technique</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">MMA Intermediate Technique</div><div class="drill-card" id="tech-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Technique Combinations</div><div class="drill-status" id="techStatus" onclick="completeDrill('tech')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Intermediate level:</strong> Beginner techniques assumed solid — now we chain them into combinations and add setup movements</div><div class="tip-row"><div class="tip-dot"></div><strong>Feints and setups:</strong> At intermediate level every technique is preceded by a setup — never attack without creating the opening first</div><div class="tip-row"><div class="tip-dot"></div><strong>Flow between techniques:</strong> One technique flows into the next — no stopping between combinations</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="techTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('tech',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('tech',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Advanced Combination Flow</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">3-4 Technique Combination Drilling</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Build longer combinations than beginner level — 3 to 4 technique chains that flow naturally from one movement to the next</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">⚡ Intermediate Session A Complete!</button>
$omnihtml$),
('mma_intermediate_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">⚡ MMA · Intermediate · Power Focus</div>
      <div class="header-title">Intermediate Session B</div>
    </div>
    <div class="level-badge">Power</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Power Generation</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Power Combinations</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Power from the ground up:</strong> At intermediate level every technique generates power from the feet through the hips — not just the arms or legs</div><div class="tip-row"><div class="tip-dot"></div><strong>Setup before power:</strong> A feint or setup movement precedes every power technique — telegraphing is a beginner habit</div><div class="tip-row"><div class="tip-dot"></div><strong>Explosive bursts:</strong> 3-second max output bursts followed by movement — this mirrors real fighting energy output</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="powerTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Bursts</div><div class="drill-card" id="burst-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Combination Bursts</div><div class="drill-status" id="burstStatus" onclick="completeDrill('burst')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">30 sec burst</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>30 seconds of maximum output — every technique at competition power and speed — then full rest</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="burstTimer">0:30</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('burst',30)">Start</button><button class="timer-btn reset" onclick="resetTimer('burst',30)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">⚡ Intermediate Session B Complete!</button>
$omnihtml$),
('mma_intermediate_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">⚡ MMA · Intermediate · Conditioning</div>
      <div class="header-title">Intermediate Session C</div>
    </div>
    <div class="level-badge">Cut</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">5-Round Conditioning</div><div class="drill-card" id="five-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">5 x 3-Minute Competition Rounds</div><div class="drill-status" id="fiveStatus" onclick="completeDrill('five')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Competition simulation:</strong> 5 rounds of 3 minutes mirrors real competition format — every round at fight pace</div><div class="tip-row"><div class="tip-dot"></div><strong>Escalate through the rounds:</strong> Rounds 1-2 build, rounds 3-4 push, round 5 is everything you have left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="fiveTimer">3:00</div><div class="timer-set-info">Round <span id="fiveCurrentSet">1</span> of <span>5</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('five',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('five',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">High Intensity Intervals</div><div class="drill-card" id="hiit-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">HIIT Technique Bursts</div><div class="drill-status" id="hiitStatus" onclick="completeDrill('hiit')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata-style technique bursts — 20 seconds of max output, 10 seconds off, 6 rounds. This builds the anaerobic capacity for competition</div></div><div class="timer-wrap"><div class="timer-label">Interval Timer</div><div class="timer-display" id="hiitTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('hiit',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('hiit',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">⚡ Intermediate Session C Complete!</button>
$omnihtml$),
('mma_intermediate_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">⚡ MMA · Intermediate · No Equipment</div>
      <div class="header-title">Intermediate Session D</div>
    </div>
    <div class="level-badge">Zero Gear</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Solo Flow</div><div class="drill-card" id="flow-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Intermediate Flow Session</div><div class="drill-status" id="flowStatus" onclick="completeDrill('flow')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — full intermediate technique flow for 4 minutes per round. Every technique from sessions A and B, chained together without stopping</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what intermediate training looks like:</strong> Fluent technique that does not require thought — just movement</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="flowTimer">4:00</div><div class="timer-set-info">Round <span id="flowCurrentSet">1</span> of <span>4</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('flow',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('flow',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Mental Game</div><div class="drill-card" id="mental-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Visualization and Mental Rehearsal</div><div class="drill-status" id="mentalStatus" onclick="completeDrill('mental')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">10 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Sit or stand quietly and visualize your techniques working against a resisting opponent — see the movement, feel it, hear it</div><div class="tip-row"><div class="tip-dot"></div>Studies show mental rehearsal activates the same neural pathways as physical practice — this is not a substitute for drilling but it is a genuine supplement</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="mentalTimer">10:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('mental',600)">Start</button><button class="timer-btn reset" onclick="resetTimer('mental',600)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">⚡ Intermediate Session D Complete!</button>
$omnihtml$),
('mt_advanced_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Muay Thai · Advanced · Technique Focus</div>
      <div class="header-title">Advanced Session A</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Technique Mastery</div><div class="drill-card" id="adv-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition-Level Technique Flow</div><div class="drill-status" id="advStatus" onclick="completeDrill('adv')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Advanced level:</strong> Techniques should be automatic — no thinking about what comes next, just flowing movement</div><div class="tip-row"><div class="tip-dot"></div><strong>Setups for everything:</strong> Every technique is preceded by a feint, a level change or a setup movement — advanced fighters never telegraph</div><div class="tip-row"><div class="tip-dot"></div><strong>Competition mindset:</strong> Visualize an opponent who is as good as you — how do you create the opening?</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="advTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('adv',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('adv',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Counter-Attack System</div><div class="drill-card" id="counter-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Counter-Attack Drilling</div><div class="drill-status" id="counterStatus" onclick="completeDrill('counter')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>React to imaginary attacks and counter with your most advanced techniques — advanced training is always reactive, not just initiative-based</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="counterTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('counter',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('counter',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Muay Thai Advanced Session A Complete!</button>
$omnihtml$),
('mt_advanced_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Muay Thai · Advanced · Power Focus</div>
      <div class="header-title">Advanced Session B</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Power Training</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Maximum Output Power Session</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Sets</div><div class="meta-chip highlight">10 sec max / 20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Absolute maximum output:</strong> 10 seconds of everything you have — every technique at competition power and aggression</div><div class="tip-row"><div class="tip-dot"></div><strong>Full rest between sets:</strong> Power training requires full recovery — 20 seconds is not enough rest, but that is the point</div><div class="tip-row"><div class="tip-dot"></div><strong>This builds competition power:</strong> The ability to generate maximum force under fatigue is what wins fights</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="powerTimer">0:10</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',10)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',10)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Power</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Full Power Combination Rounds</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">60 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>2 minutes of combinations thrown with fight-night power — not cardio pace, not technique pace, power pace — every technique designed to finish</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Muay Thai Advanced Session B Complete!</button>
$omnihtml$),
('mt_advanced_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Muay Thai · Advanced · Conditioning</div>
      <div class="header-title">Advanced Session C</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Conditioning</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">8 x 3-Minute Elite Rounds</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">8 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>8 rounds at fight pace:</strong> This is the advanced conditioning benchmark — if you can complete this at full intensity you have competition-level cardio</div><div class="tip-row"><div class="tip-dot"></div><strong>Rounds 1-3:</strong> Build pace — technical but intense<br/><strong>Rounds 4-6:</strong> Push harder — combinations longer<br/><strong>Rounds 7-8:</strong> Championship rounds — everything left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">3:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>8</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Anaerobic Finisher</div><div class="drill-card" id="finish-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Finisher</div><div class="drill-status" id="finishStatus" onclick="completeDrill('finish')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata finisher after the main rounds — this is the pain that builds champions. 20 seconds of absolute maximum output, 10 seconds off, 4 rounds.</div></div><div class="timer-wrap"><div class="timer-label">Tabata Timer</div><div class="timer-display" id="finishTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('finish',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('finish',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Muay Thai Advanced Session C Complete!</button>
$omnihtml$),
('mt_advanced_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Muay Thai · Advanced · No Equipment</div>
      <div class="header-title">Advanced Session D</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Solo Session</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Advanced Solo Flow</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — the complete advanced session using every technique from sessions A, B and C in a continuous flow</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what elite training looks like without a gym:</strong> A complete fighter can train anywhere, anytime, with nothing</div><div class="tip-row"><div class="tip-dot"></div><strong>Mental component:</strong> Visualize competition opponents — specific scenarios, specific counters — not just moving through techniques</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">4:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>6</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Visualization Training</div><div class="drill-card" id="viz-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition Mental Rehearsal</div><div class="drill-status" id="vizStatus" onclick="completeDrill('viz')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">15 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Sit or stand quietly and run through your complete game plan — every technique working, every position controlled, every submission finished — in vivid detail</div><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Jon Jones, GSP, Ronda Rousey — visualization is a documented performance enhancer at the highest levels of combat sports</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="vizTimer">15:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('viz',900)">Start</button><button class="timer-btn reset" onclick="resetTimer('viz',900)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Muay Thai Advanced Session D Complete!</button>
$omnihtml$),
('mt_intermediate_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Muay Thai · Intermediate · Technique Focus</div>
      <div class="header-title">Intermediate Session A</div>
    </div>
    <div class="level-badge">Technique</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🦵 Drill 1 — Teep to Combination</div><div class="drill-card" id="teep-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Teep Setup Combinations</div><div class="drill-status" id="teepStatus" onclick="completeDrill('teep')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Teep as a weapon not just a push:</strong> At intermediate level the teep is used to create distance, disrupt rhythm and set up follow-up strikes</div><div class="tip-row"><div class="tip-dot"></div><strong>Teep → kick:</strong> Push them back with the teep, step in and fire the rear roundhouse to the body or head</div><div class="tip-row"><div class="tip-dot"></div><strong>Double teep:</strong> Two teeps in a row — first one tests the distance, second one lands</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="teepTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('teep',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('teep',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🦵 Drill 2 — Elbow Entries</div><div class="drill-card" id="elbow-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Elbow Strike Entries</div><div class="drill-status" id="elbowStatus" onclick="completeDrill('elbow')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">10 each side</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Horizontal elbow (sok tad):</strong> Step in and swing the elbow horizontally across — the most powerful elbow strike</div><div class="tip-row"><div class="tip-dot"></div><strong>Upward elbow (sok ngad):</strong> Drive the elbow upward under the chin — effective when opponent is moving forward</div><div class="tip-row"><div class="tip-dot"></div><strong>Why elbows matter:</strong> Elbows are the most dangerous weapon in Muay Thai — they cut, they KO and they work at clinch range where punches can't</div></div><div class="rep-counter"><div class="rep-label">Rep Counter (Each Side)</div><div class="rep-display" id="elbowCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('elbow',-1)">−</button><button class="rep-btn plus" onclick="changeRep('elbow',1)">+</button></div></div></div></div>
  <div class="section"><div class="section-header">🦵 Drill 3 — 8-Weapon Shadow</div><div class="drill-card" id="eight-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Full 8-Weapon Shadowboxing</div><div class="drill-status" id="eightStatus" onclick="completeDrill('eight')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Use all 8 weapons equally — punches, kicks, knees AND elbows. If you are not throwing elbows in your shadow rounds you are not doing Muay Thai</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eightTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('eight',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('eight',180)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦵 Intermediate Session A Complete!</button>
$omnihtml$),
('mt_intermediate_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Muay Thai · Intermediate · Power Focus</div>
      <div class="header-title">Intermediate Session B</div>
    </div>
    <div class="level-badge">Power</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🦵 Drill 1 — Power Knee Strikes</div><div class="drill-card" id="knee-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Explosive Knee Strike Combos</div><div class="drill-status" id="kneeStatus" onclick="completeDrill('knee')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">10 each side</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Pull and drive:</strong> Imagine grabbing an opponent's neck in a clinch and driving your knee into their midsection — hips drive through</div><div class="tip-row"><div class="tip-dot"></div><strong>Jumping knee (khao loi):</strong> Step in, jump off the front foot, drive the rear knee — the most devastating weapon in the clinch</div><div class="tip-row"><div class="tip-dot"></div><strong>3-knee burst:</strong> Alternating knees in rapid succession — this is what wins clinch battles in Thailand</div></div><div class="rep-counter"><div class="rep-label">Rep Counter (Each Side)</div><div class="rep-display" id="kneeCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('knee',-1)">−</button><button class="rep-btn plus" onclick="changeRep('knee',1)">+</button></div></div></div></div>
  <div class="section"><div class="section-header">🦵 Drill 2 — Spinning Back Elbow</div><div class="drill-card" id="spin-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Spinning Back Elbow</div><div class="drill-status" id="spinStatus" onclick="completeDrill('spin')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">3 Sets</div><div class="meta-chip highlight">6 each side</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Pivot and drive:</strong> Spin on your front foot, driving the rear elbow backward and through — look over the shoulder to spot the target first</div><div class="tip-row"><div class="tip-dot"></div><strong>This is an advanced weapon:</strong> Rarely expected, extremely effective when landed — a hallmark of intermediate Muay Thai</div></div><div class="rep-counter"><div class="rep-label">Rep Counter (Each Side)</div><div class="rep-display" id="spinCount">0</div><div class="rep-btns"><button class="rep-btn minus" onclick="changeRep('spin',-1)">−</button><button class="rep-btn plus" onclick="changeRep('spin',1)">+</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦵 Intermediate Session B Complete!</button>
$omnihtml$),
('mt_intermediate_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Muay Thai · Intermediate · Conditioning</div>
      <div class="header-title">Intermediate Session C</div>
    </div>
    <div class="level-badge">Cut</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🦵 Drill 1 — Thai Camp Rounds</div><div class="drill-card" id="camp-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">5 x 3-Minute Thai Camp Rounds</div><div class="drill-status" id="campStatus" onclick="completeDrill('camp')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Full Muay Thai shadowboxing — all 8 weapons, teeps, elbow entries, knee simulations — for 5 full rounds</div><div class="tip-row"><div class="tip-dot"></div><strong>Round 5 rule:</strong> The last round is always your hardest. That is what separates fighters from athletes</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="campTimer">3:00</div><div class="timer-set-info">Round <span id="campCurrentSet">1</span> of <span>5</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('camp',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('camp',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">🦵 Drill 2 — Kick Volume Intervals</div><div class="drill-card" id="kicks-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Kick Intervals</div><div class="drill-status" id="kicksStatus" onclick="completeDrill('kicks')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">30 sec max kicks</div><div class="meta-chip">20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Max roundhouse kicks in 30 seconds alternating legs — this is the specific leg endurance that wins rounds in Muay Thai</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="kicksTimer">0:30</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('kicks',30)">Start</button><button class="timer-btn reset" onclick="resetTimer('kicks',30)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦵 Intermediate Session C Complete!</button>
$omnihtml$),
('mt_intermediate_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Muay Thai · Intermediate · No Equipment</div>
      <div class="header-title">Intermediate Session D</div>
    </div>
    <div class="level-badge">Zero Gear</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">🦵 Drill 1 — Full 8-Weapon Flow</div><div class="drill-card" id="flow-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Muay Thai Flow</div><div class="drill-status" id="flowStatus" onclick="completeDrill('flow')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment, full Muay Thai — every weapon, every combination, every defensive movement flowing for 3 minutes straight</div><div class="tip-row"><div class="tip-dot"></div>This is exactly how Thai fighters train on rest days and travel days — no equipment needed for a complete session</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="flowTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('flow',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('flow',180)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦵 Intermediate Session D Complete!</button>
$omnihtml$),
('taekwondo_advanced_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Taekwondo · Advanced · Technique Focus</div>
      <div class="header-title">Advanced Session A</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Technique Mastery</div><div class="drill-card" id="adv-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition-Level Technique Flow</div><div class="drill-status" id="advStatus" onclick="completeDrill('adv')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Advanced level:</strong> Techniques should be automatic — no thinking about what comes next, just flowing movement</div><div class="tip-row"><div class="tip-dot"></div><strong>Setups for everything:</strong> Every technique is preceded by a feint, a level change or a setup movement — advanced fighters never telegraph</div><div class="tip-row"><div class="tip-dot"></div><strong>Competition mindset:</strong> Visualize an opponent who is as good as you — how do you create the opening?</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="advTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('adv',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('adv',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Counter-Attack System</div><div class="drill-card" id="counter-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Counter-Attack Drilling</div><div class="drill-status" id="counterStatus" onclick="completeDrill('counter')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>React to imaginary attacks and counter with your most advanced techniques — advanced training is always reactive, not just initiative-based</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="counterTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('counter',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('counter',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Taekwondo Advanced Session A Complete!</button>
$omnihtml$),
('taekwondo_advanced_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Taekwondo · Advanced · Power Focus</div>
      <div class="header-title">Advanced Session B</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Power Training</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Maximum Output Power Session</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Sets</div><div class="meta-chip highlight">10 sec max / 20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Absolute maximum output:</strong> 10 seconds of everything you have — every technique at competition power and aggression</div><div class="tip-row"><div class="tip-dot"></div><strong>Full rest between sets:</strong> Power training requires full recovery — 20 seconds is not enough rest, but that is the point</div><div class="tip-row"><div class="tip-dot"></div><strong>This builds competition power:</strong> The ability to generate maximum force under fatigue is what wins fights</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="powerTimer">0:10</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',10)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',10)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Power</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Full Power Combination Rounds</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">60 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>2 minutes of combinations thrown with fight-night power — not cardio pace, not technique pace, power pace — every technique designed to finish</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Taekwondo Advanced Session B Complete!</button>
$omnihtml$),
('taekwondo_advanced_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Taekwondo · Advanced · Conditioning</div>
      <div class="header-title">Advanced Session C</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Conditioning</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">8 x 3-Minute Elite Rounds</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">8 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>8 rounds at fight pace:</strong> This is the advanced conditioning benchmark — if you can complete this at full intensity you have competition-level cardio</div><div class="tip-row"><div class="tip-dot"></div><strong>Rounds 1-3:</strong> Build pace — technical but intense<br/><strong>Rounds 4-6:</strong> Push harder — combinations longer<br/><strong>Rounds 7-8:</strong> Championship rounds — everything left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">3:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>8</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Anaerobic Finisher</div><div class="drill-card" id="finish-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Finisher</div><div class="drill-status" id="finishStatus" onclick="completeDrill('finish')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata finisher after the main rounds — this is the pain that builds champions. 20 seconds of absolute maximum output, 10 seconds off, 4 rounds.</div></div><div class="timer-wrap"><div class="timer-label">Tabata Timer</div><div class="timer-display" id="finishTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('finish',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('finish',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Taekwondo Advanced Session C Complete!</button>
$omnihtml$),
('taekwondo_advanced_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Taekwondo · Advanced · No Equipment</div>
      <div class="header-title">Advanced Session D</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Solo Session</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Advanced Solo Flow</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — the complete advanced session using every technique from sessions A, B and C in a continuous flow</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what elite training looks like without a gym:</strong> A complete fighter can train anywhere, anytime, with nothing</div><div class="tip-row"><div class="tip-dot"></div><strong>Mental component:</strong> Visualize competition opponents — specific scenarios, specific counters — not just moving through techniques</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">4:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>6</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Visualization Training</div><div class="drill-card" id="viz-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition Mental Rehearsal</div><div class="drill-status" id="vizStatus" onclick="completeDrill('viz')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">15 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Sit or stand quietly and run through your complete game plan — every technique working, every position controlled, every submission finished — in vivid detail</div><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Jon Jones, GSP, Ronda Rousey — visualization is a documented performance enhancer at the highest levels of combat sports</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="vizTimer">15:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('viz',900)">Start</button><button class="timer-btn reset" onclick="resetTimer('viz',900)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Taekwondo Advanced Session D Complete!</button>
$omnihtml$),
('taekwondo_intermediate_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Taekwondo · Intermediate · Technique Focus</div>
      <div class="header-title">Intermediate Session A</div>
    </div>
    <div class="level-badge">Technique</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Taekwondo Intermediate Technique</div><div class="drill-card" id="tech-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Technique Combinations</div><div class="drill-status" id="techStatus" onclick="completeDrill('tech')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Intermediate level:</strong> Beginner techniques assumed solid — now we chain them into combinations and add setup movements</div><div class="tip-row"><div class="tip-dot"></div><strong>Feints and setups:</strong> At intermediate level every technique is preceded by a setup — never attack without creating the opening first</div><div class="tip-row"><div class="tip-dot"></div><strong>Flow between techniques:</strong> One technique flows into the next — no stopping between combinations</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="techTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('tech',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('tech',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Advanced Combination Flow</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">3-4 Technique Combination Drilling</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Build longer combinations than beginner level — 3 to 4 technique chains that flow naturally from one movement to the next</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦵 Intermediate Session A Complete!</button>
$omnihtml$),
('taekwondo_intermediate_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Taekwondo · Intermediate · Power Focus</div>
      <div class="header-title">Intermediate Session B</div>
    </div>
    <div class="level-badge">Power</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Power Generation</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Power Combinations</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Power from the ground up:</strong> At intermediate level every technique generates power from the feet through the hips — not just the arms or legs</div><div class="tip-row"><div class="tip-dot"></div><strong>Setup before power:</strong> A feint or setup movement precedes every power technique — telegraphing is a beginner habit</div><div class="tip-row"><div class="tip-dot"></div><strong>Explosive bursts:</strong> 3-second max output bursts followed by movement — this mirrors real fighting energy output</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="powerTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Bursts</div><div class="drill-card" id="burst-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Combination Bursts</div><div class="drill-status" id="burstStatus" onclick="completeDrill('burst')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">30 sec burst</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>30 seconds of maximum output — every technique at competition power and speed — then full rest</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="burstTimer">0:30</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('burst',30)">Start</button><button class="timer-btn reset" onclick="resetTimer('burst',30)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦵 Intermediate Session B Complete!</button>
$omnihtml$),
('taekwondo_intermediate_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Taekwondo · Intermediate · Conditioning</div>
      <div class="header-title">Intermediate Session C</div>
    </div>
    <div class="level-badge">Cut</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">5-Round Conditioning</div><div class="drill-card" id="five-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">5 x 3-Minute Competition Rounds</div><div class="drill-status" id="fiveStatus" onclick="completeDrill('five')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Competition simulation:</strong> 5 rounds of 3 minutes mirrors real competition format — every round at fight pace</div><div class="tip-row"><div class="tip-dot"></div><strong>Escalate through the rounds:</strong> Rounds 1-2 build, rounds 3-4 push, round 5 is everything you have left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="fiveTimer">3:00</div><div class="timer-set-info">Round <span id="fiveCurrentSet">1</span> of <span>5</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('five',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('five',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">High Intensity Intervals</div><div class="drill-card" id="hiit-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">HIIT Technique Bursts</div><div class="drill-status" id="hiitStatus" onclick="completeDrill('hiit')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata-style technique bursts — 20 seconds of max output, 10 seconds off, 6 rounds. This builds the anaerobic capacity for competition</div></div><div class="timer-wrap"><div class="timer-label">Interval Timer</div><div class="timer-display" id="hiitTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('hiit',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('hiit',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦵 Intermediate Session C Complete!</button>
$omnihtml$),
('taekwondo_intermediate_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🦵 Taekwondo · Intermediate · No Equipment</div>
      <div class="header-title">Intermediate Session D</div>
    </div>
    <div class="level-badge">Zero Gear</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Solo Flow</div><div class="drill-card" id="flow-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Intermediate Flow Session</div><div class="drill-status" id="flowStatus" onclick="completeDrill('flow')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — full intermediate technique flow for 4 minutes per round. Every technique from sessions A and B, chained together without stopping</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what intermediate training looks like:</strong> Fluent technique that does not require thought — just movement</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="flowTimer">4:00</div><div class="timer-set-info">Round <span id="flowCurrentSet">1</span> of <span>4</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('flow',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('flow',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Mental Game</div><div class="drill-card" id="mental-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Visualization and Mental Rehearsal</div><div class="drill-status" id="mentalStatus" onclick="completeDrill('mental')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">10 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Sit or stand quietly and visualize your techniques working against a resisting opponent — see the movement, feel it, hear it</div><div class="tip-row"><div class="tip-dot"></div>Studies show mental rehearsal activates the same neural pathways as physical practice — this is not a substitute for drilling but it is a genuine supplement</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="mentalTimer">10:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('mental',600)">Start</button><button class="timer-btn reset" onclick="resetTimer('mental',600)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🦵 Intermediate Session D Complete!</button>
$omnihtml$),
('wrestling_advanced_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🤼 Wrestling · Advanced · Technique Focus</div>
      <div class="header-title">Advanced Session A</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Technique Mastery</div><div class="drill-card" id="adv-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition-Level Technique Flow</div><div class="drill-status" id="advStatus" onclick="completeDrill('adv')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Advanced level:</strong> Techniques should be automatic — no thinking about what comes next, just flowing movement</div><div class="tip-row"><div class="tip-dot"></div><strong>Setups for everything:</strong> Every technique is preceded by a feint, a level change or a setup movement — advanced fighters never telegraph</div><div class="tip-row"><div class="tip-dot"></div><strong>Competition mindset:</strong> Visualize an opponent who is as good as you — how do you create the opening?</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="advTimer">3:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('adv',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('adv',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Counter-Attack System</div><div class="drill-card" id="counter-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Counter-Attack Drilling</div><div class="drill-status" id="counterStatus" onclick="completeDrill('counter')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>React to imaginary attacks and counter with your most advanced techniques — advanced training is always reactive, not just initiative-based</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="counterTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('counter',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('counter',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Wrestling Advanced Session A Complete!</button>
$omnihtml$),
('wrestling_advanced_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🤼 Wrestling · Advanced · Power Focus</div>
      <div class="header-title">Advanced Session B</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Power Training</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Maximum Output Power Session</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Sets</div><div class="meta-chip highlight">10 sec max / 20 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Absolute maximum output:</strong> 10 seconds of everything you have — every technique at competition power and aggression</div><div class="tip-row"><div class="tip-dot"></div><strong>Full rest between sets:</strong> Power training requires full recovery — 20 seconds is not enough rest, but that is the point</div><div class="tip-row"><div class="tip-dot"></div><strong>This builds competition power:</strong> The ability to generate maximum force under fatigue is what wins fights</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="powerTimer">0:10</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',10)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',10)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Power</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Full Power Combination Rounds</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">60 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>2 minutes of combinations thrown with fight-night power — not cardio pace, not technique pace, power pace — every technique designed to finish</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Wrestling Advanced Session B Complete!</button>
$omnihtml$),
('wrestling_advanced_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🤼 Wrestling · Advanced · Conditioning</div>
      <div class="header-title">Advanced Session C</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Conditioning</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">8 x 3-Minute Elite Rounds</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">8 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>8 rounds at fight pace:</strong> This is the advanced conditioning benchmark — if you can complete this at full intensity you have competition-level cardio</div><div class="tip-row"><div class="tip-dot"></div><strong>Rounds 1-3:</strong> Build pace — technical but intense<br/><strong>Rounds 4-6:</strong> Push harder — combinations longer<br/><strong>Rounds 7-8:</strong> Championship rounds — everything left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">3:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>8</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Anaerobic Finisher</div><div class="drill-card" id="finish-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Finisher</div><div class="drill-status" id="finishStatus" onclick="completeDrill('finish')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata finisher after the main rounds — this is the pain that builds champions. 20 seconds of absolute maximum output, 10 seconds off, 4 rounds.</div></div><div class="timer-wrap"><div class="timer-label">Tabata Timer</div><div class="timer-display" id="finishTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('finish',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('finish',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Wrestling Advanced Session C Complete!</button>
$omnihtml$),
('wrestling_advanced_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🤼 Wrestling · Advanced · No Equipment</div>
      <div class="header-title">Advanced Session D</div>
    </div>
    <div class="level-badge">🏆 Advanced</div>
  </div>

  <div class="elite-banner">
    <div class="elite-banner-icon">🏆</div>
    <div class="elite-banner-text"><strong>Elite Level — Warrior Exclusive.</strong> Advanced sessions are for athletes who have fully internalized beginner and intermediate foundations. Techniques are referenced without explanation — execution and volume are the focus.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Advanced Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">5 Minutes</div><div class="meta-chip">Includes technique activation</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">5:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',300)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',300)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Elite Solo Session</div><div class="drill-card" id="elite-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Advanced Solo Flow</div><div class="drill-status" id="eliteStatus" onclick="completeDrill('elite')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — the complete advanced session using every technique from sessions A, B and C in a continuous flow</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what elite training looks like without a gym:</strong> A complete fighter can train anywhere, anytime, with nothing</div><div class="tip-row"><div class="tip-dot"></div><strong>Mental component:</strong> Visualize competition opponents — specific scenarios, specific counters — not just moving through techniques</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="eliteTimer">4:00</div><div class="timer-set-info">Round <span id="eliteCurrentSet">1</span> of <span>6</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('elite',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('elite',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Visualization Training</div><div class="drill-card" id="viz-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Competition Mental Rehearsal</div><div class="drill-status" id="vizStatus" onclick="completeDrill('viz')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">15 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Sit or stand quietly and run through your complete game plan — every technique working, every position controlled, every submission finished — in vivid detail</div><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Jon Jones, GSP, Ronda Rousey — visualization is a documented performance enhancer at the highest levels of combat sports</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="vizTimer">15:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('viz',900)">Start</button><button class="timer-btn reset" onclick="resetTimer('viz',900)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Advanced Recovery</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Full body stretch — 5 minutes minimum at advanced volume</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal decompression — child's pose 90 seconds</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Session review — identify one weakness to address next time</div>
        <div class="cooldown-item"><div class="cooldown-icon">📝</div>Log your performance — advanced athletes track everything</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🏆 Wrestling Advanced Session D Complete!</button>
$omnihtml$),
('wrestling_intermediate_a', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🤼 Wrestling · Intermediate · Technique Focus</div>
      <div class="header-title">Intermediate Session A</div>
    </div>
    <div class="level-badge">Technique</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Wrestling Intermediate Technique</div><div class="drill-card" id="tech-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Technique Combinations</div><div class="drill-status" id="techStatus" onclick="completeDrill('tech')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Intermediate level:</strong> Beginner techniques assumed solid — now we chain them into combinations and add setup movements</div><div class="tip-row"><div class="tip-dot"></div><strong>Feints and setups:</strong> At intermediate level every technique is preceded by a setup — never attack without creating the opening first</div><div class="tip-row"><div class="tip-dot"></div><strong>Flow between techniques:</strong> One technique flows into the next — no stopping between combinations</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="techTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('tech',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('tech',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Advanced Combination Flow</div><div class="drill-card" id="combo-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">3-4 Technique Combination Drilling</div><div class="drill-status" id="comboStatus" onclick="completeDrill('combo')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Build longer combinations than beginner level — 3 to 4 technique chains that flow naturally from one movement to the next</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="comboTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('combo',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('combo',120)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🤼 Intermediate Session A Complete!</button>
$omnihtml$),
('wrestling_intermediate_b', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🤼 Wrestling · Intermediate · Power Focus</div>
      <div class="header-title">Intermediate Session B</div>
    </div>
    <div class="level-badge">Power</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Power Generation</div><div class="drill-card" id="power-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Advanced Power Combinations</div><div class="drill-status" id="powerStatus" onclick="completeDrill('power')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">2 min each</div><div class="meta-chip">45 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Power from the ground up:</strong> At intermediate level every technique generates power from the feet through the hips — not just the arms or legs</div><div class="tip-row"><div class="tip-dot"></div><strong>Setup before power:</strong> A feint or setup movement precedes every power technique — telegraphing is a beginner habit</div><div class="tip-row"><div class="tip-dot"></div><strong>Explosive bursts:</strong> 3-second max output bursts followed by movement — this mirrors real fighting energy output</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="powerTimer">2:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('power',120)">Start</button><button class="timer-btn reset" onclick="resetTimer('power',120)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Explosive Combination Bursts</div><div class="drill-card" id="burst-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Max Output Combination Bursts</div><div class="drill-status" id="burstStatus" onclick="completeDrill('burst')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Sets</div><div class="meta-chip highlight">30 sec burst</div><div class="meta-chip">30 sec rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>30 seconds of maximum output — every technique at competition power and speed — then full rest</div></div><div class="timer-wrap"><div class="timer-label">Burst Timer</div><div class="timer-display" id="burstTimer">0:30</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('burst',30)">Start</button><button class="timer-btn reset" onclick="resetTimer('burst',30)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🤼 Intermediate Session B Complete!</button>
$omnihtml$),
('wrestling_intermediate_c', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🤼 Wrestling · Intermediate · Conditioning</div>
      <div class="header-title">Intermediate Session C</div>
    </div>
    <div class="level-badge">Cut</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">5-Round Conditioning</div><div class="drill-card" id="five-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">5 x 3-Minute Competition Rounds</div><div class="drill-status" id="fiveStatus" onclick="completeDrill('five')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">5 Rounds</div><div class="meta-chip highlight">3 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Competition simulation:</strong> 5 rounds of 3 minutes mirrors real competition format — every round at fight pace</div><div class="tip-row"><div class="tip-dot"></div><strong>Escalate through the rounds:</strong> Rounds 1-2 build, rounds 3-4 push, round 5 is everything you have left</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="fiveTimer">3:00</div><div class="timer-set-info">Round <span id="fiveCurrentSet">1</span> of <span>5</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('five',180)">Start</button><button class="timer-btn reset" onclick="resetTimer('five',180)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">High Intensity Intervals</div><div class="drill-card" id="hiit-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">HIIT Technique Bursts</div><div class="drill-status" id="hiitStatus" onclick="completeDrill('hiit')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">6 Sets</div><div class="meta-chip highlight">20 sec on / 10 sec off</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Tabata-style technique bursts — 20 seconds of max output, 10 seconds off, 6 rounds. This builds the anaerobic capacity for competition</div></div><div class="timer-wrap"><div class="timer-label">Interval Timer</div><div class="timer-display" id="hiitTimer">0:20</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('hiit',20)">Start</button><button class="timer-btn reset" onclick="resetTimer('hiit',20)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🤼 Intermediate Session C Complete!</button>
$omnihtml$),
('wrestling_intermediate_d', $omnihtml$
  <div class="workout-header">
    <a class="back-btn" href="library.html">←</a>
    <div>
      <div class="header-eyebrow">🤼 Wrestling · Intermediate · No Equipment</div>
      <div class="header-title">Intermediate Session D</div>
    </div>
    <div class="level-badge">Zero Gear</div>
  </div>

  <div class="warrior-banner">
    <div class="warrior-banner-icon">⚔️</div>
    <div class="warrior-banner-text"><strong>Warrior Exclusive.</strong> Intermediate sessions assume your beginner foundations are solid. Techniques are referenced by name — focus on execution quality and higher volume.</div>
  </div>

  <div class="section">
    <div class="section-header">🔥 Warm Up</div>
    <div class="drill-card" id="warmup-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;">
        <div class="drill-name">Extended Warm Up</div>
        <div class="drill-status" id="warmupStatus" onclick="completeDrill('warmup')">○</div>
      </div>
      <div class="drill-meta"><div class="meta-chip highlight">4 Minutes</div><div class="meta-chip">Higher intensity than beginner</div></div>
      <div class="timer-wrap">
        <div class="timer-label">Warm Up</div>
        <div class="timer-display" id="warmupTimer">4:00</div>
        <div class="timer-btns">
          <button class="timer-btn start" onclick="startTimer('warmup',240)">Start</button>
          <button class="timer-btn reset" onclick="resetTimer('warmup',240)">Reset</button>
        </div>
      </div>
    </div>
  </div>

  <div class="section"><div class="section-header">Advanced Solo Flow</div><div class="drill-card" id="flow-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Complete Intermediate Flow Session</div><div class="drill-status" id="flowStatus" onclick="completeDrill('flow')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">4 Rounds</div><div class="meta-chip highlight">4 min each</div><div class="meta-chip">1 min rest</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div>Zero equipment — full intermediate technique flow for 4 minutes per round. Every technique from sessions A and B, chained together without stopping</div><div class="tip-row"><div class="tip-dot"></div><strong>This is what intermediate training looks like:</strong> Fluent technique that does not require thought — just movement</div></div><div class="timer-wrap"><div class="timer-label">Round Timer</div><div class="timer-display" id="flowTimer">4:00</div><div class="timer-set-info">Round <span id="flowCurrentSet">1</span> of <span>4</span></div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('flow',240)">Start</button><button class="timer-btn reset" onclick="resetTimer('flow',240)">Reset</button></div></div></div></div>
  <div class="section"><div class="section-header">Mental Game</div><div class="drill-card" id="mental-card"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:14px;"><div class="drill-name">Visualization and Mental Rehearsal</div><div class="drill-status" id="mentalStatus" onclick="completeDrill('mental')">○</div></div><div class="drill-meta"><div class="meta-chip highlight">10 Minutes</div></div><div class="tips-wrap"><div class="tip-row"><div class="tip-dot"></div><strong>Elite athletes all do this:</strong> Sit or stand quietly and visualize your techniques working against a resisting opponent — see the movement, feel it, hear it</div><div class="tip-row"><div class="tip-dot"></div>Studies show mental rehearsal activates the same neural pathways as physical practice — this is not a substitute for drilling but it is a genuine supplement</div></div><div class="timer-wrap"><div class="timer-label">Timer</div><div class="timer-display" id="mentalTimer">10:00</div><div class="timer-btns"><button class="timer-btn start" onclick="startTimer('mental',600)">Start</button><button class="timer-btn reset" onclick="resetTimer('mental',600)">Reset</button></div></div></div></div>

  <div class="section">
    <div class="section-header">🧘 Cool Down</div>
    <div class="drill-card" id="cooldown-card">
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;">
        <div class="drill-name">Stretch and Recover</div>
        <div class="drill-status" id="cooldownStatus" onclick="completeDrill('cooldown')">○</div>
      </div>
      <div class="cooldown-list">
        <div class="cooldown-item"><div class="cooldown-icon">🤸</div>Hip flexor and hamstring stretch — 45 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🧘</div>Spinal twist — 30 sec each side</div>
        <div class="cooldown-item"><div class="cooldown-icon">🌀</div>Child's pose — 60 sec</div>
        <div class="cooldown-item"><div class="cooldown-icon">💭</div>Review one thing you want to improve next session</div>
      </div>
    </div>
  </div>

  <button class="complete-btn" onclick="completeSession()">🤼 Intermediate Session D Complete!</button>
$omnihtml$)
on conflict (slug) do update
  set html = excluded.html,
      updated_at = now();
