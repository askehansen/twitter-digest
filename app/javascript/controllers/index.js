import { application } from "./application"

import LottiePlayerController from "./lottie_player_controller"
application.register('lottie-player', LottiePlayerController)

import NewDigestController from "./new_digest_controller"
application.register('new-digest', NewDigestController)

import DetectTimezoneController from "./detect_timezone_controller"
application.register('detect-timezone', DetectTimezoneController)