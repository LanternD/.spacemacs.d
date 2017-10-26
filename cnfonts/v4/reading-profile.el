;;; `cnfonts--custom-set-fontsnames' 列表有3个子列表，第1个为英文字体列表，第2个为中文字体列表，
;;; 第3个列表中的字体用于显示不常用汉字，每一个字体列表中，*第一个* *有效并可用* 的字体将被使用。
;;; 将光标移动到上述列表中，按 `C-c C-c' 可以测试字体显示效果。另外，用户可以通过命令
;;; `cnfonts-insert-fontname’ 来选择一个 *可用* 字体，然后在当前光标处插入其字体名称。
(setq cnfonts--custom-set-fontnames
      '(
        ("Fira Code" "Monaco" "DejaVu Sans Mono" "Courier New" "Lucida Console" "Inconsolata" "Ubuntu Mono" "Consolas" "Droid Sans Mono" "Droid Sans Mono Pro" "Lucida Sans Typewriter" "Lucida Typewriter" "Fira Mono")
        ("黑体" "文泉驿正黑" "文泉驿等宽微米黑" "微软雅黑" "Noto Sans S Chinese Regular" "Microsoft Yahei" "Microsoft_Yahei" "文泉驿等宽正黑" "文泉驿点阵正黑")
        ("PMingLiU-ExtB" "HanaMinB" "SimSun-ExtB" "MingLiU-ExtB" "MingLiU_HKSCS-ExtB")
        ))

;;; `cnfonts--custom-set-fontsizes' 中，所有元素的结构都类似：(英文字号 中文字号 EXT-B字体字号)
;;; 将光标移动到各个数字上，按 C-c C-c 查看光标处字号的对齐效果。
;;; 按 C-<up> 增大光标处字号，按 C-<down> 减小光标处字号。
(setq cnfonts--custom-set-fontsizes
      '(
        (9    11.0 11.0)
        (10   12.0 12.0)
        (11.5 13.5 13.5)
        (12.5 15.5 15.5)
        (14   17.0 17.0)
        (15   18.0 18.0)
        (16   19.5 19.5)
        (18   21.5 21.5)
        (20   24.0 24.0)
        (22   25.5 25.5)
        (24   28.5 28.5)
        (26   31.5 31.5)
        (28   33.0 33.0)
        (30   36.0 36.0)
        (32   39.0 39.0)
        ))
