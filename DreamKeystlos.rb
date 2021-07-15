use_bpm 125
samples = "C:/Users/calto/OneDrive/Documents/Live Coding/drums/250tlos/"

live_loop :drums do
  sample samples, 2, beat_stretch: 8, cutoff: 130 , amp: 2
  ##| sample samples, 1, beat_stretch: 8, cutoff: 130 , amp: 2
  sleep 8
end

live_loop :basss, sync: :drums do
  use_random_seed 50
  use_synth :fm
  4.times do
    play chord(:E2, :major7).choose, cutoff: 130, amp: 1
    sleep choose [0.25,0.5]
  end
end

with_fx :reverb, room: 0.9 do
  with_fx :echo, decay: 4, phase: 1  do
    live_loop :highbass, sync: :drums do
      use_random_seed 44
      8.times do
        notes2 = (scale :e3, :major, num_octaves: 2).shuffle
        n2 = synth :fm, amp: 1, cutoff: 130, note_slide: 0
        control n2, note: notes2.choose
        sleep choose ([0.5])
      end
      sleep 8
      ##| use_random_seed 44
      4.times do
        notes2 = (scale :e2, :major, num_octaves: 1).shuffle
        n2 = synth :chiplead, amp: 0.5, cutoff: 40, note_slide: 0
        control n2, note: notes2.choose
        sleep choose ([0.25])
      end
      sleep 8
      sleep 4
    end
  end
end

with_fx :reverb, room: 0 do
  ##| with_fx :echo, decay: 4, phase: 1  do
  live_loop :lowlow do
    use_random_seed 44
    4.times do
      notes2 = (scale :e1, :major, num_octaves: 2).shuffle
      ##| n2 = synth :fm, amp: 1, cutoff: 130, note_slide: 0
      ##| control n2, note: notes2.choose
      sleep choose ([0.5])
    end
    ##| sleep 4
  end
  ##| end
end