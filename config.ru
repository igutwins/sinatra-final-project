require_relative './config/environment'

use Rack::MethodOverride
use UsersController
use ScorecardsController
use DealsController
run ApplicationController