/* ═══════════════════════════════════════════════════════════════════
   ☕ Crema — Core Framework JavaScript v2.0
   Theme loader, page lifecycle, modal & settings utilities
   Unified design language across Sillyboard, LaserStation, & Settings
   ═══════════════════════════════════════════════════════════════════ */

(function () {
    'use strict';

    // ── Theme Loader (runs immediately) ──────────────────────────────
    // Bridge: read crema keys first, then fall back to launcher keys
    const bg = localStorage.getItem('crema-bg') || localStorage.getItem('launcher-bg') || '#1a0d0b';
    const fg = localStorage.getItem('crema-fg') || localStorage.getItem('launcher-accent') || '#d4a373';
    document.documentElement.style.setProperty('--crema-bg', bg);
    document.documentElement.style.setProperty('--crema-fg', fg);

    // Also update derived focus ring color dynamically
    // Parse fg hex to RGB for the focus ring
    function hexToRgb(hex) {
        const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
        return result ? {
            r: parseInt(result[1], 16),
            g: parseInt(result[2], 16),
            b: parseInt(result[3], 16)
        } : { r: 212, g: 163, b: 115 };
    }

    const fgRgb = hexToRgb(fg);
    document.documentElement.style.setProperty(
        '--crema-focus-ring',
        `rgba(${fgRgb.r}, ${fgRgb.g}, ${fgRgb.b}, 0.3)`
    );

    // ── Page Lifecycle ───────────────────────────────────────────────
    window.addEventListener('DOMContentLoaded', () => {
        requestAnimationFrame(() => {
            // Enable transitions
            document.documentElement.classList.add('crema-ready');

            // Reveal page wrappers
            document.querySelectorAll('.crema-page').forEach(page => {
                page.classList.add('crema-visible');
            });
        });
    });

    // ── Navigation Utilities ─────────────────────────────────────────

    /**
     * Get the URL to navigate back to.
     * Checks sessionStorage for launch source context.
     */
    function getBackUrl(defaultUrl) {
        const source = sessionStorage.getItem('launchSource');
        if (source === 'apps') return 'apps.html';
        return defaultUrl || 'index.html';
    }

    /**
     * Navigate back with a fade-out animation.
     * @param {string} [url] - Override URL. Defaults to getBackUrl().
     */
    function navigateBack(url) {
        const target = url || getBackUrl();
        const page = document.querySelector('.crema-page');
        if (page) {
            page.classList.add('crema-exit');
        } else {
            document.body.classList.add('crema-exit');
        }
        setTimeout(() => {
            window.location.href = target;
        }, 400);
    }

    /**
     * Set up history-based back button interception.
     * When the user presses the browser back button, fade out and navigate.
     * @param {string} [defaultBackUrl] - Where to go on back. Defaults to getBackUrl().
     */
    function setupBackNavigation(defaultBackUrl) {
        history.replaceState({ page: 'applet' }, '');
        history.pushState({ page: 'applet-active' }, '');

        window.addEventListener('popstate', (e) => {
            if (e.state && e.state.page === 'applet') {
                navigateBack(defaultBackUrl);
            }
        });

        // Auto-bind all .crema-back buttons
        document.querySelectorAll('.crema-back').forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.preventDefault();
                navigateBack(btn.getAttribute('href') || defaultBackUrl);
            });
        });
    }

    // ── Modal Utilities ──────────────────────────────────────────────

    /**
     * Show a confirm/alert modal.
     * @param {Object} options
     * @param {string} options.title - Modal title
     * @param {string} options.message - Modal body text
     * @param {string} [options.confirmText='OK'] - Confirm button text
     * @param {string} [options.cancelText='Cancel'] - Cancel button text
     * @param {boolean} [options.showCancel=true] - Whether to show cancel button
     * @returns {Promise<boolean>} - Resolves true if confirmed, false if cancelled
     */
    function showModal(options) {
        return new Promise((resolve) => {
            // Build overlay
            const overlay = document.createElement('div');
            overlay.className = 'crema-modal-overlay';
            overlay.setAttribute('role', 'dialog');
            overlay.setAttribute('aria-modal', 'true');
            overlay.setAttribute('aria-label', options.title);

            const modal = document.createElement('div');
            modal.className = 'crema-modal';

            const title = document.createElement('h3');
            title.textContent = options.title;

            const message = document.createElement('p');
            message.textContent = options.message;

            const actions = document.createElement('div');
            actions.className = 'crema-modal-actions';

            const showCancel = options.showCancel !== false;

            if (showCancel) {
                const cancelBtn = document.createElement('button');
                cancelBtn.className = 'crema-btn crema-btn-ghost';
                cancelBtn.textContent = options.cancelText || 'Cancel';
                cancelBtn.addEventListener('click', () => cleanup(false));
                actions.appendChild(cancelBtn);
            }

            const confirmBtn = document.createElement('button');
            confirmBtn.className = 'crema-btn';
            confirmBtn.textContent = options.confirmText || 'OK';
            confirmBtn.addEventListener('click', () => cleanup(true));
            actions.appendChild(confirmBtn);

            modal.appendChild(title);
            modal.appendChild(message);
            modal.appendChild(actions);
            overlay.appendChild(modal);
            document.body.appendChild(overlay);

            // Trap focus
            requestAnimationFrame(() => {
                overlay.classList.add('crema-active');
                confirmBtn.focus();
            });

            // Escape key
            function onKeydown(e) {
                if (e.key === 'Escape') cleanup(false);
            }
            document.addEventListener('keydown', onKeydown);

            // Backdrop click
            overlay.addEventListener('click', (e) => {
                if (e.target === overlay) cleanup(false);
            });

            function cleanup(result) {
                document.removeEventListener('keydown', onKeydown);
                overlay.classList.remove('crema-active');
                setTimeout(() => {
                    overlay.remove();
                    resolve(result);
                }, 300);
            }
        });
    }

    // ── Themes ───────────────────────────────────────────────────────
    const themes = [
        { name: 'Coffiest', bg: '#1a0d0b', fg: '#d4a373' },
        { name: 'Cuddlebug', bg: '#4b2e2a', fg: '#fff3e0' },
        { name: 'Tux', bg: '#000000', fg: '#f39c12' },
        { name: 'OLED', bg: '#000000', fg: '#ffffff' },
        { name: 'Light', bg: '#ffffff', fg: '#000000' }
    ];

    /**
     * Apply a theme and persist to localStorage.
     * @param {string} bg - Background hex color
     * @param {string} fg - Foreground hex color
     */
    function setTheme(bg, fg) {
        document.documentElement.style.setProperty('--crema-bg', bg);
        document.documentElement.style.setProperty('--crema-fg', fg);
        localStorage.setItem('crema-bg', bg);
        localStorage.setItem('crema-fg', fg);

        const fgRgb = hexToRgb(fg);
        document.documentElement.style.setProperty(
            '--crema-focus-ring',
            `rgba(${fgRgb.r}, ${fgRgb.g}, ${fgRgb.b}, 0.3)`
        );

        // Broadcast for canvas-based components
        window.dispatchEvent(new CustomEvent('crema-theme-changed', { detail: { bg, fg } }));
    }

    /**
     * Get the current theme colors.
     * @returns {{ bg: string, fg: string }}
     */
    function getTheme() {
        return {
            bg: localStorage.getItem('crema-bg') || '#1a0d0b',
            fg: localStorage.getItem('crema-fg') || '#d4a373'
        };
    }

    /**
     * Get the list of built-in themes.
     */
    function getThemes() {
        return themes;
    }

    // ── Interactive Components ───────────────────────────────────────

    /**
     * Initialize a custom slider.
     * @param {HTMLElement} container - The .crema-slider-wrap element
     * @param {Object} options - { min, max, value, step, onChange, snapBack, onZoneChange }
     */
    function initSlider(container, options = {}) {
        const track = container.querySelector('.crema-slider-track');
        const fill = container.querySelector('.crema-slider-fill');
        const thumb = container.querySelector('.crema-slider-thumb');
        const valueEl = container.querySelector('.crema-slider-value');

        let min = options.min || 0;
        let max = options.max || 100;
        let step = options.step || 1;
        let value = options.value || min;
        let isDragging = false;

        function update(val, isFinal = false) {
            value = Math.max(min, Math.min(max, val));
            const pct = ((value - min) / (max - min)) * 100;
            
            if (options.snapBack && !isDragging) {
                fill.style.transition = 'width 0.4s var(--crema-ease-spring), left 0.4s var(--crema-ease-spring)';
                thumb.style.transition = 'left 0.4s var(--crema-ease-spring)';
            } else {
                fill.style.transition = 'none';
                thumb.style.transition = 'none';
            }

            // Special fill logic for snap-back (centered) sliders
            if (options.snapBack) {
                const centerPct = 50;
                if (pct >= centerPct) {
                    fill.style.left = '50%';
                    fill.style.width = (pct - 50) + '%';
                } else {
                    fill.style.left = pct + '%';
                    fill.style.width = (50 - pct) + '%';
                }
            } else {
                fill.style.width = pct + '%';
                fill.style.left = '0';
            }

            thumb.style.left = pct + '%';
            if (valueEl) valueEl.textContent = Math.round(value);
            if (options.onChange) options.onChange(value, isFinal);
        }

        function handlePointer(e) {
            const rect = track.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const pct = Math.max(0, Math.min(1, x / rect.width));
            const rawVal = min + pct * (max - min);
            const steppedVal = Math.round(rawVal / step) * step;
            update(steppedVal, e.type === 'pointerup');
        }

        track.addEventListener('pointerdown', (e) => {
            track.setPointerCapture(e.pointerId);
            isDragging = true;
            handlePointer(e);
            
            const onPointerMove = (me) => handlePointer(me);
            const onPointerUp = (ue) => {
                isDragging = false;
                handlePointer(ue);
                if (options.snapBack) {
                    update((min + max) / 2, true);
                }
                track.removeEventListener('pointermove', onPointerMove);
                track.removeEventListener('pointerup', onPointerUp);
            };

            track.addEventListener('pointermove', onPointerMove);
            track.addEventListener('pointerup', onPointerUp);
        });

        update(value);
        return { update };
    }

    /**
     * Initialize a jog wheel.
     * @param {HTMLElement} container - The .crema-jog-wrap element
     * @param {Object} options - { onRotate, size }
     */
    function initJogWheel(container, options = {}) {
        const canvas = container.querySelector('.crema-jog-canvas');
        const ctx = canvas.getContext('2d');
        const size = options.size || 200;
        const dpr = window.devicePixelRatio || 1;

        canvas.width = size * dpr;
        canvas.height = size * dpr;
        canvas.style.width = size + 'px';
        canvas.style.height = size + 'px';
        ctx.scale(dpr, dpr);

        let angle = 0;
        let lastAngle = 0;
        let isDragging = false;

        function draw() {
            const theme = getTheme();
            const center = size / 2;
            const radius = (size / 2) - 10;

            ctx.clearRect(0, 0, size, size);

            // Outer ring
            ctx.beginPath();
            ctx.arc(center, center, radius, 0, Math.PI * 2);
            ctx.strokeStyle = theme.fg;
            ctx.lineWidth = 4;
            ctx.stroke();

            // Inner surface
            ctx.beginPath();
            ctx.arc(center, center, radius - 8, 0, Math.PI * 2);
            ctx.fillStyle = 'rgba(255, 255, 255, 0.05)';
            ctx.fill();

            // Rotation indicators
            ctx.save();
            ctx.translate(center, center);
            ctx.rotate(angle);
            
            ctx.strokeStyle = theme.fg;
            ctx.lineWidth = 2;
            ctx.lineCap = 'round';
            
            for (let i = 0; i < 12; i++) {
                ctx.beginPath();
                ctx.moveTo(0, -radius + 15);
                ctx.lineTo(0, -radius + 30);
                ctx.stroke();
                ctx.rotate(Math.PI / 6);
            }
            
            // Thumb notch
            ctx.beginPath();
            ctx.arc(0, -radius + 45, 8, 0, Math.PI * 2);
            ctx.fillStyle = theme.fg;
            ctx.fill();
            
            ctx.restore();
        }

        function getPointerAngle(e) {
            const rect = canvas.getBoundingClientRect();
            const x = e.clientX - (rect.left + rect.width / 2);
            const y = e.clientY - (rect.top + rect.height / 2);
            return Math.atan2(y, x);
        }

        canvas.addEventListener('pointerdown', (e) => {
            canvas.setPointerCapture(e.pointerId);
            isDragging = true;
            lastAngle = getPointerAngle(e);
        });

        window.addEventListener('pointermove', (e) => {
            if (!isDragging) return;
            const currentAngle = getPointerAngle(e);
            let delta = currentAngle - lastAngle;

            // Handle wrap-around
            if (delta > Math.PI) delta -= Math.PI * 2;
            if (delta < -Math.PI) delta += Math.PI * 2;

            angle += delta;
            lastAngle = currentAngle;
            
            draw();
            if (options.onRotate) options.onRotate(delta);
        });

        window.addEventListener('pointerup', () => {
            isDragging = false;
        });

        window.addEventListener('crema-theme-changed', draw);
        draw();

        return {
            setAngle: (a) => { angle = a; draw(); }
        };
    }

    // ── Toggle Group Utility ─────────────────────────────────────────

    /**
     * Initialize toggle groups with keyboard navigation.
     * @param {HTMLElement} container - The .crema-toggle element
     * @param {function} onChange - Called with the active tab's data-value
     */
    function initToggle(container, onChange) {
        const tabs = container.querySelectorAll('.crema-toggle-tab');

        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                tabs.forEach(t => t.classList.remove('crema-active'));
                tab.classList.add('crema-active');
                if (onChange) onChange(tab.dataset.value || tab.textContent);
            });

            tab.addEventListener('keydown', (e) => {
                const tabArray = Array.from(tabs);
                const idx = tabArray.indexOf(tab);
                let next = -1;

                if (e.key === 'ArrowRight' || e.key === 'ArrowDown') {
                    next = (idx + 1) % tabArray.length;
                } else if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') {
                    next = (idx - 1 + tabArray.length) % tabArray.length;
                }

                if (next >= 0) {
                    e.preventDefault();
                    tabArray[next].click();
                    tabArray[next].focus();
                }
            });
        });
    }

    // ── Storage Listener ─────────────────────────────────────────────

    /**
     * Listen for theme changes from other tabs/applets.
     */
    window.addEventListener('storage', (e) => {
        if (e.key === 'crema-bg' && e.newValue) {
            document.documentElement.style.setProperty('--crema-bg', e.newValue);
        }
        if (e.key === 'crema-fg' && e.newValue) {
            document.documentElement.style.setProperty('--crema-fg', e.newValue);
            const rgb = hexToRgb(e.newValue);
            document.documentElement.style.setProperty(
                '--crema-focus-ring',
                `rgba(${rgb.r}, ${rgb.g}, ${rgb.b}, 0.3)`
            );
            window.dispatchEvent(new CustomEvent('crema-theme-changed', { 
                detail: { bg: localStorage.getItem('crema-bg'), fg: e.newValue } 
            }));
        }
    });

    // ── Settings Modal Builder ────────────────────────────────────────

    /**
     * Render a complete settings modal (identical to Sillyboard / LaserStation).
     * Injects DOM, wires theme presets + custom pickers, and returns open/close API.
     * @param {Object} [options]
     * @param {HTMLElement} [options.trigger] - Button that opens the modal
     * @param {string} [options.storagePrefix='crema'] - localStorage key prefix
     * @param {Array} [options.extraSections] - Additional HTML sections [{title, html}]
     * @returns {{ open(), close(), overlay: HTMLElement }}
     */
    function renderSettingsModal(options = {}) {
        const prefix = options.storagePrefix || 'crema';
        const bgKey = prefix + '-bg';
        const fgKey = prefix === 'crema' ? prefix + '-fg' : prefix + '-accent';

        // Build overlay
        const overlay = document.createElement('div');
        overlay.className = 'crema-settings-overlay';
        overlay.setAttribute('role', 'dialog');
        overlay.setAttribute('aria-modal', 'true');
        overlay.setAttribute('aria-label', 'Settings');

        let extraHTML = '';
        if (options.extraSections) {
            options.extraSections.forEach(s => {
                extraHTML += `<div style="margin-top:clamp(14px,3vw,24px)"><div class="crema-settings-section">${s.title}</div></div>${s.html}`;
            });
        }

        const panel = document.createElement('div');
        panel.className = 'crema-settings-panel';
        panel.innerHTML = `
            <h2>Settings</h2>
            <div style="margin-bottom:8px"><div class="crema-settings-section">Theme Presets</div></div>
            <div class="crema-settings-theme-grid" id="crema-stg-themes"></div>
            <div style="margin-bottom:6px"><div class="crema-settings-section">Custom Theme</div></div>
            <div class="crema-picker-row">
                <div class="crema-picker-wrap"><span>Background</span><input type="color" id="crema-stg-bg-picker"></div>
                <div class="crema-picker-wrap"><span>Accent</span><input type="color" id="crema-stg-ac-picker"></div>
            </div>
            ${extraHTML}
            <div class="crema-settings-close-row">
                <button class="crema-settings-close-btn" id="crema-stg-close">Done</button>
            </div>
        `;
        overlay.appendChild(panel);
        document.body.appendChild(overlay);

        // Render theme grid
        const grid = panel.querySelector('#crema-stg-themes');
        themes.forEach(t => {
            const btn = document.createElement('button');
            btn.className = 'crema-settings-theme-btn';
            btn.textContent = t.name;
            btn.addEventListener('click', () => setTheme(t.bg, t.fg));
            grid.appendChild(btn);
        });

        // Wire pickers
        const bgPicker = panel.querySelector('#crema-stg-bg-picker');
        const acPicker = panel.querySelector('#crema-stg-ac-picker');

        function syncPickers() {
            const cs = getComputedStyle(document.documentElement);
            bgPicker.value = cs.getPropertyValue('--crema-bg').trim() || '#1a0d0b';
            acPicker.value = cs.getPropertyValue('--crema-fg').trim() || '#d4a373';
        }

        bgPicker.addEventListener('input', () => {
            setTheme(bgPicker.value, acPicker.value);
        });
        acPicker.addEventListener('input', () => {
            setTheme(bgPicker.value, acPicker.value);
        });

        // Close handlers
        const closeBtn = panel.querySelector('#crema-stg-close');
        function close() { overlay.classList.remove('crema-active'); }
        function open() { syncPickers(); overlay.classList.add('crema-active'); }

        closeBtn.addEventListener('click', close);
        overlay.addEventListener('click', (e) => { if (e.target === overlay) close(); });

        // Wire trigger if provided
        if (options.trigger) {
            options.trigger.addEventListener('click', open);
        }

        return { open, close, overlay };
    }

    // ── Public API ───────────────────────────────────────────────────
    window.Crema = {
        getBackUrl,
        navigateBack,
        setupBackNavigation,
        showModal,
        setTheme,
        getTheme,
        getThemes,
        initToggle,
        initSlider,
        initJogWheel,
        renderSettingsModal,
        version: '2.0.0'
    };

})();
