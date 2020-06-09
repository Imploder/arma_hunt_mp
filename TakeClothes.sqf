private ["_target_uniform","_player_uniform"];
params ["_target","_player"];

if (uniform _target isequalto "") exitwith {
    systemChat "No uniform to steal";
};

_playerloadout = getunitloadout _player;
_targetloadout = getunitloadout _target;

_player_uniform_with_items = _playerloadout param [3, ""];
_target_uniform_with_items = _targetloadout param [3, ""];

_player_outfit = _player_uniform_with_items param [0, ""];
_target_outfit = _target_uniform_with_items param [0, ""];

_player_uniform_with_items set [0, _target_outfit];
_target_uniform_with_items set [0, _player_outfit];

_playerloadout set [3, _player_uniform_with_items];
_targetloadout set [3, _target_uniform_with_items];

_player setunitloadout _playerloadout;
_target setunitloadout _targetloadout;