% существующие герои
hero(axe).
hero(pudge).
hero(chaos_knight).
hero(doom).
hero(void).
hero(phantom_assasin).
hero(drow_ranger).
hero(morphling).
hero(crystal_maiden).
hero(leshrac).
hero(warlock).
hero(outworld_destroyer).

% существующие стихии героев
attr(strength).
attr(agility).
attr(intelligence).

% существующие типы атаки героев
attack_type(melee).
attack_type(ranged).

% существующие сложности героев
complexity(easy).
complexity(medium).
complexity(hard).

% присваиваем стихии
has_attr(axe, strength).
has_attr(pudge, strength).
has_attr(chaos_knight, strength).
has_attr(doom, strength).
has_attr(void, agility).
has_attr(phantom_assasin, agility).
has_attr(drow_ranger, agility).
has_attr(morphling, agility).
has_attr(crystal_maiden, intelligence).
has_attr(leshrac, intelligence).
has_attr(warlock, intelligence).
has_attr(outworld_destroyer, intelligence).

% присваиваем типы атак
has_attack_type(axe, melee).
has_attack_type(pudge, melee).
has_attack_type(chaos_knight, melee).
has_attack_type(doom, melee).
has_attack_type(void, melee).
has_attack_type(phantom_assasin, melee).
has_attack_type(drow_ranger, ranged).
has_attack_type(morphling, ranged).
has_attack_type(crystal_maiden, ranged).
has_attack_type(leshrac, ranged).
has_attack_type(warlock, ranged).
has_attack_type(outworld_destroyer, ranged).

% присваиваем сложности персонажей
has_complexity(axe, easy).
has_complexity(pudge, medium).
has_complexity(chaos_knight, easy).
has_complexity(doom, medium).
has_complexity(void, medium).
has_complexity(phantom_assasin, easy).
has_complexity(drow_ranger, easy).
has_complexity(morphling, hard).
has_complexity(crystal_maiden, easy).
has_complexity(leshrac, medium).
has_complexity(warlock, easy).
has_complexity(outworld_destroyer, medium).

% персонаж подходит для новичков, если имеет ближний тип атаки и легкую сложность, или дальний тип атаки и легкую или среднюю сложности (за персонажей дальнего боя легче играть)
for_beginners(X) :- (has_complexity(X, easy), has_attack_type(X, melee)); ((has_complexity(X, easy); has_complexity(X, medium)), has_attack_type(X, ranged)).

% персонаж является войном, если его стихия -- сила, и он имеет ближний тип атаки
is_warrior(X) :- has_attr(X, strength), has_attack_type(X, melee).

% персонаж является ассасином, если его стихия -- ловкость, и он имеет дальний тип атаки
is_assasin(X) :- has_attr(X, agility), has_attack_type(X, melee).

% персонаж является магом, если его стихия -- интеллект, и он имеет дальний тип атаки
is_magician(X) :- has_attr(X, intelligence), has_attack_type(X, ranged).

% персонажи хорошо сочетаются, если не являются одновременно войнами или ассасинами или магами
combine_well(X, Y) :- hero(X), hero(Y), not((is_warrior(X), is_warrior(Y)); (is_assasin(X), is_assasin(Y)); (is_magician(X), is_magician(Y))).

% запросы
% hero(void).
% attack_type(melee).
% hero(void), attack_type(melee).
% has_complexity(X, medium).
% is_magician(X), has_complexity(X, easy).
% has_complexity(X, easy), has_complexity(Y, hard), combine_well(X, Y).
